	<script type="text/javascript">
	 function showonlyone(clr,act) {
		 if(clr=="appLanguages"||clr=="appLanguages"||clr=="appLanguages"){
				
				document.getElementById(clr).style.backgroundColor = "#65cbf9";
				document.getElementById(act).style.color = "red !important";
		}else if(clr=="empleavebyteamid"||clr=="empleavebyteamid"||clr=="empleavebyteamid"){
			
			document.getElementById(clr).style.backgroundColor = "#65cbf9";
			document.getElementById(act).style.color = "#fff !important";
			
			
	}else if(clr=="appdashboard"||clr=="appdashboard"||clr=="appdashboard"){
		
		document.getElementById(clr).style.backgroundColor = "#65cbf9";
		document.getElementById(act).style.color = "red !important";
			
		
}
	 }
	</script>
<div class="col-lg-2 mypadding" style="background-color: #dedede; min-height: 500px;">
			<div class="accordion mb-2" id="accordionExample">
				<div class="card" >
					<div class="card-header" id="appdashboard">
						<h2 class="mb-0" id="appdashboards1"><a href="adminLoginPage?clr=appdashboard&act=appdashboard" ><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard </a></h2>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="appLanguages">
						<h2 class="mb-0" id="appLanguagevs"><a href="userManagementList?clr=appLanguages&act=appLanguages1" ><i class="fa fa-leanpub" aria-hidden="true"></i> User Management</a></h2>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFive">
						<h2 class="mb-0"><a href="AdminLogout"><i class="fa fa-power-off"></i> Logout</a></h2>
					</div>
				</div>
			</div>
		</div>
		
		<style>
		#appdashboard {
    background-color: #fcfcfc !important;
    /* color: #000; */
}
#appdashboard:hover {
    background-color: #000 !important;
    color: #fff !important;
}
		
		</style>