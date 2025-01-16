<?php
include 'db_connect.php';

if (isset($_GET['id'])) {
    $qry = $conn->query("SELECT * FROM staff WHERE id = " . $_GET['id']);
    if ($qry->num_rows > 0) {
        foreach ($qry->fetch_assoc() as $k => $v) {
            $$k = $v;
        }
    }
}
?>

<div class="container-fluid">
    <form id="manage-staff">
        <input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
        <div class="form-group">
            <label for="staff_id">Staff ID</label>
            <input type="text" name="staff_id" id="staff_id" class="form-control" value="<?php echo isset($staff_id) ? $staff_id : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="full_name">Full Name</label>
            <input type="text" name="full_name" id="full_name" class="form-control" value="<?php echo isset($full_name) ? $full_name : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control" value="<?php echo isset($email) ? $email : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" name="phone" id="phone" class="form-control" value="<?php echo isset($phone) ? $phone : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" name="department" id="department" class="form-control" value="<?php echo isset($department) ? $department : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="campus">Campus</label>
            <input type="text" name="campus" id="campus" class="form-control" value="<?php echo isset($campus) ? $campus : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="present_appointment">Present Appointment</label>
            <input type="text" name="present_appointment" id="present_appointment" class="form-control" value="<?php echo isset($present_appointment) ? $present_appointment : '' ?>" required>
        </div>
        <div class="form-group">
            <label for="staff_category">Staff Category</label>
            <input type="text" name="staff_category" id="staff_category" class="form-control" value="<?php echo isset($staff_category) ? $staff_category : '' ?>" required>
        </div>
    </form>
</div>

<script>
    $('#manage-staff').submit(function(e) {
        e.preventDefault();
        start_load();
        $.ajax({
            url: 'ajax.php?action=save_staff',
            data: new FormData($(this)[0]),
            method: 'POST',
            processData: false,
            contentType: false,
            success: function(resp) {
                if (resp == 1) {
                    alert_toast("Staff data successfully saved", "success");
                    setTimeout(function() {
                        location.reload();
                    }, 1500);
                } else {
                    alert_toast("An error occurred", "danger");
                }
                end_load();
            }
        });
    });
</script>
