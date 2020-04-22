	<script type="text/javascript">
	 function showonlyone(clr,act) {
		 if(clr=="appLanguages"||clr=="appLanguages"||clr=="appLanguages"){
				
				document.getElementById(clr).style.backgroundColor = "#65cbf9";
				document.getElementById(act).style.color = "#fff !important";
		}else if(clr=="empleavebyteamid"||clr=="empleavebyteamid"||clr=="empleavebyteamid"){
			
			document.getElementById(clr).style.backgroundColor = "#65cbf9";
			document.getElementById(act).style.color = "#fff !important";
			
			
	}else if(clr=="appdashboard"||clr=="appdashboard"||clr=="appdashboard"){
		
		document.getElementById(clr).style.backgroundColor = "#65cbf9";
		document.getElementById(act).style.color = "#fff !important";
			
		
}
	 }
	</script>
<div class="col-lg-2 mypadding" style="background-color: #dedede; min-height: 500px;">
			<div class="accordion mb-2" id="accordionExample">
				<div class="card" style="display: none;">
					<div class="card-header" id="headingOne">
						<h2 class="mb-0">									
							<a data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
								<span><i class="fa fa-user"></i> Account</span>
								<i class="fa fa-chevron-down toggle"></i>
							</a>
						</h2>
					</div>
					<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
							<ul class="list-group">
								<li class="list-group-item"><a href="#"><i class="fa fa-pencil"></i> Edit Info</a></li>
								<li class="list-group-item"><a href="#"><i class="fa fa-key"></i> Change Password</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="appdashboard">
						<h2 class="mb-0" id="appdashboards"><a href="empDashboard?clr=appdashboard&act=appdashboard" ><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard</a></h2>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="appLanguages">
						<h2 class="mb-0" id="appLanguagevs"><a href="empAppraisalList?clr=appLanguages&act=appLanguages1" ><i class="fa fa-leanpub" aria-hidden="true"></i> Appraisal</a></h2>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="empleavebyteamid">
						<h2 class="mb-0"><a href="empLeave?clr=empleavebyteamid&act=empleavebyteamid"><i class="fa fa-sign-out" aria-hidden="true"></i> Leave</a></h2>
					</div>
				</div>
				
				<div class="card">
					<div class="card-header" id="headingFive">
						<h2 class="mb-0"><a href="EmpLogout"><i class="fa fa-power-off"></i> Logout</a></h2>
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