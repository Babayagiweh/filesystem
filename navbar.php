<style>
	
</style>

<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">

				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home"></i></span> Home</a>
				<a href="index.php?page=files" class="nav-item nav-files"><span class='icon-field'><i class="fa fa-file"></i></span> Files</a>
				<a href="index.php?page=gallery" class="nav-item nav-files"><span class='icon-field'><i class="fa fa-file"></i></span> Gallery</a>
				<a href="index.php?page=calendar" class="nav-item nav-files"><span class='icon-field'><i class="fa fa-file"></i></span> Calander</a>
				<?php if($_SESSION['login_type'] == 1): ?>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Users</a>
				<a href="index.php?page=staff" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users"></i></span> Staff</a>
				<a href="index.php?page=events" class="nav-item nav-files"><span class='icon-field'><i class="fa fa-file"></i></span> Events</a>
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>