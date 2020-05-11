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
	}else if(clr=="app_section2"||clr=="app_section2"||clr=="app_section2"){
		document.getElementById(clr).style.backgroundColor = "#65cbf9";
		document.getElementById(act).style.color = "red !important";
	}else if(clr=="app_section3"||clr=="app_section3"||clr=="app_section3"){
		document.getElementById(clr).style.backgroundColor = "#65cbf9";
		document.getElementById(act).style.color = "red !important";
	}
	 }
	</script>
<div class="col-lg-2 mypadding" style="background-color: #dedede; min-height: 500px;">
			<div class="accordion mb-2" id="accordionExample">
				<div class="card" >
					<div class="card-header" id="appdashboard" style="display: none;">
						<h2 class="mb-0" id="appdashboards1"><a href="adminLoginPage?clr=appdashboard&act=appdashboard" ><i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard </a></h2>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="appLanguages">
						<h2 class="mb-0" id="appLanguagevs"><a href="judgesSection1?clr=appLanguages&act=appLanguages1" ><i class="fa fa-leanpub" aria-hidden="true"></i>Section 1</a></h2>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="app_section2">
						<h2 class="mb-0" id="app_section2h2"><a href="judgesSection2?clr=app_section2&act=app_section2" ><i class="fa fa-leanpub" aria-hidden="true"></i>Section 2</a></h2>
					</div>
				</div>
				<div class="card" >
					<div class="card-header" id="app_section3">
						<h2 class="mb-0" id="app_section3h2"><a href="judgesSection3?clr=app_section3&act=app_section3" ><i class="fa fa-leanpub" aria-hidden="true"></i>Section 3</a></h2>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingFive">
						<h2 class="mb-0"><a href="JudgesLogout"><i class="fa fa-power-off"></i> Logout</a></h2>
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