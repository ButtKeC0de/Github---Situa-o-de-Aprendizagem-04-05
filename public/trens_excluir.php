<?php
session_start();

// Importa o arquivo de conexão já existente
 require_once '../infra/conexao.php'; // Altere para o nome correto do seu arquivo de conexão (ex: db.php)

$id =$_GET['id'] ?? null;

if ($id) {
    try {
        // Supondo que a variável de conexão do seu arquivo seja $pdo ou$conn
        $stmt =$pdo->prepare("DELETE FROM Trem WHERE id_trem = :id");
        $stmt->execute([':id' =>$id]);

        if ($stmt->rowCount() > 0) {$_SESSION['mensagem'] = "<div class='alert alert-success alert-dismissible fade show' role='alert'>
                                        Trem ID <strong>{$id}</strong> foi excluído com sucesso!
                                        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                                    </div>";
        } else {
            $_SESSION['mensagem'] = "<div class='alert alert-warning alert-dismissible fade show' role='alert'>
                                        Nenhum trem foi encontrado com o ID <strong>{$id}</strong>.
                                        <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                                    </div>";
        }
    } catch (PDOException $e) {$_SESSION['mensagem'] = "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                                    Não foi possível excluir o trem. Ele possui vínculos ativos no sistema (sensores, rotas ou manutenção).
                                    <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                                </div>";
    }
} else {
    $_SESSION['mensagem'] = "<div class='alert alert-danger alert-dismissible fade show' role='alert'>
                                Nenhum ID válido foi fornecido para exclusão.
                                <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                            </div>";
}

header("Location: trens_lista.php");
exit();
?>