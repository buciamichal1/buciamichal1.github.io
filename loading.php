<?php
// process.php
header('Content-Type: application/json');

// Parametry połączenia z bazą danych
$host = 'localhost';
$dbname = 'asriders';
$user = 'root';
$password = '';

// Tworzenie połączenia
$conn = new mysqli($host, $user, $password, $dbname);

// Sprawdzenie połączenia
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Zapytanie SQL
$sql = "SELECT `name`,`zdjecie`,`ilosc_kupionych` FROM produkty ORDER BY ilosc_kupionych DESC LIMIT 10;";
$result = $conn->query($sql);

// Przygotowanie danych do JSON
$users = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

// Zamykanie połączenia
$conn->close();

// Wysyłanie danych do klienta w formacie JSON
echo json_encode($users);
?>
