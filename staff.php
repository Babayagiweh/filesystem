<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item text-success">Home</li>
  </ol>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-12">
      <button class="btn btn-success float-right btn-md" id="new_staff"><i class="fa fa-plus"></i> New Staff</button>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="card col-lg-12">
      <div class="card-body">
        <table class="table-striped table-bordered col-md-12">
          <thead>
            <tr>
              <th class="text-center">S/No</th>
              <th class="text-center">Staff ID</th>
              <th class="text-center">Full Name</th>
              <th class="text-center">Grade</th>
              <th class="text-center">Department</th>
              <th class="text-center">Email</th>
              <th class="text-center">Phone</th>
              <th class="text-center">Campus</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>
            <?php
              include 'db_connect.php';
              $staff = $conn->query("SELECT * FROM staff ORDER BY full_name ASC");
              if ($staff->num_rows > 0):
                $i = 1;
                while ($row = $staff->fetch_assoc()):
            ?>
            <tr>
              <td class="text-center"><?php echo $i++ ?></td>
              <td class="text-center"><?php echo $row['staff_id'] ?></td>
              <td class="text-center"><?php echo $row['full_name'] ?></td>
              <td class="text-center"><?php echo $row['present_appointment'] ?></td>
              <td class="text-center"><?php echo $row['department'] ?></td>
              <td class="text-center"><?php echo $row['email'] ?></td>
              <td class="text-center"><?php echo $row['phone'] ?></td>
              <td class="text-center"><?php echo $row['campus'] ?></td>
              <td class="text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-success">Action</button>
                  <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item edit_staff" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>">Edit</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item delete_staff" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>">Delete</a>
                  </div>
                </div>
              </td>
            </tr>
            <?php endwhile; else: ?>
            <tr>
              <td class="text-center" colspan="9">No staff records found.</td>
            </tr>
            <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script>
  $('#new_staff').click(function() {
    uni_modal('New Staff', 'manage_staff.php');
  });

  $('.edit_staff').click(function() {
    uni_modal('Edit Staff', 'manage_staff.php?id=' + $(this).attr('data-id'));
  });

  $('.delete_staff').click(function() {
    _conf('Are you sure to delete this staff?', 'delete_staff', [$(this).attr('data-id')]);
  });

  function delete_staff(id) {
    start_load();
    $.ajax({
      url: 'ajax.php?action=delete_staff',
      method: 'POST',
      data: { id: id },
      success: function(resp) {
        if (resp == 1) {
          alert_toast('Staff successfully deleted', 'success');
          setTimeout(function() {
            location.reload();
          }, 1500);
        }
      }
    });
  }
</script>
