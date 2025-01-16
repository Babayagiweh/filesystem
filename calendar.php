<?php
include 'database/db_connect.php'; // Include the database connection

// Initialize variables to handle form data
$search_date_from = isset($_POST['date_from']) ? $_POST['date_from'] : '';
$search_date_to = isset($_POST['date_to']) ? $_POST['date_to'] : '';
$search_department = isset($_POST['department']) ? $_POST['department'] : '';

// Query to fetch activities based on form input
$query = "SELECT * FROM activities WHERE 1";

// Add filters to the query based on form input
if ($search_date_from) {
    $query .= " AND activity_date >= :date_from";
}
if ($search_date_to) {
    $query .= " AND activity_date <= :date_to";
}
if ($search_department) {
    $query .= " AND directorate = :department";
}

// Prepare and execute the query
$stmt = $pdo->prepare($query);

if ($search_date_from) {
    $stmt->bindParam(':date_from', $search_date_from);
}
if ($search_date_to) {
    $stmt->bindParam(':date_to', $search_date_to);
}
if ($search_department) {
    $stmt->bindParam(':department', $search_department);
}

$stmt->execute();
$activities = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Calendar of Activities | DICT</title>
    <!-- Bootstrap 5 and Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .card-header {
            background-color: #28a745;
            color: white;
        }
        .btn-custom {
            background-color: #ffc107;
            color: white;
        }
        .btn-custom:hover {
            background-color: #e0a800;
        }
        #calendar {
            max-width: 100%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Filter Form -->
        <h3 class="text-center">Filter Activities</h3>
        <form action="calendar_activities.php" method="POST" class="bg-light p-4 rounded">
            <div class="row">
                <div class="col-md-4">
                    <label for="date_from" class="form-label">Date From:</label>
                    <input type="date" class="form-control" name="date_from" id="date_from" value="<?php echo htmlspecialchars($search_date_from); ?>">
                </div>
                <div class="col-md-4">
                    <label for="date_to" class="form-label">Date To:</label>
                    <input type="date" class="form-control" name="date_to" id="date_to" value="<?php echo htmlspecialchars($search_date_to); ?>">
                </div>
                <div class="col-md-4">
                    <label for="department" class="form-label">Department:</label>
                    <select class="form-control" name="department" id="department">
                        <option value="">Select Department</option>
                        <option value="Directorate of ICT" <?php echo ($search_department == 'Directorate of ICT') ? 'selected' : ''; ?>>Directorate of ICT</option>
                        <option value="Directorate of Academic Affairs" <?php echo ($search_department == 'Directorate of Academic Affairs') ? 'selected' : ''; ?>>Directorate of Academic Affairs</option>
                        <option value="Directorate of Finance" <?php echo ($search_department == 'Directorate of Finance') ? 'selected' : ''; ?>>Directorate of Finance</option>
                    </select>
                </div>
            </div>
            <div class="d-flex justify-content-between mt-3">
                <button type="submit" class="btn btn-custom">Filter Activities</button>
                <a href="index.php?page=add_activity" class="btn btn-custom">Add New Activity</a>
            </div>
        </form>

        <!-- Calendar Section -->
        <div class="row mt-5">
            <div class="col-lg-8">
                <h3 class="text-center">Calendar</h3>
                <div id="calendar"></div>
            </div>
            <div class="col-lg-4">
                <h3 class="text-center">Upcoming Activities</h3>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>S/No</th>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Venue</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        foreach ($activities as $activity):
                        ?>
                        <tr>
                            <td><?php echo $i++; ?></td>
                            <td><?php echo htmlspecialchars($activity['activity_title']); ?></td>
                            <td><?php echo htmlspecialchars($activity['activity_date']); ?></td>
                            <td><?php echo htmlspecialchars($activity['venue']); ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#calendar').fullCalendar({
                events: [
                    <?php foreach ($activities as $activity): ?>
                    {
                        title: '<?php echo addslashes($activity['activity_title']); ?>',
                        start: '<?php echo $activity['activity_date'] . " " . $activity['activity_time']; ?>',
                        location: '<?php echo addslashes($activity['venue']); ?>',
                    },
                    <?php endforeach; ?>
                ],
                eventClick: function(event) {
                    alert('Title: ' + event.title + '\nLocation: ' + event.location);
                }
            });
        });
    </script>
</body>
</html>
