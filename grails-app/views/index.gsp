<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<meta name="layout" content="homepage_main" />
<resource:include components="map"
	key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E" />
<g:javascript library="jquery" />
<resource:autoComplete skin="default" />
</head>

<body>
	<!----start-header---------->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<!--------start-logo------>
				<div class="logo">

					<img src="${resource(dir: 'images', file: 'site-logo.png')}" alt="" />

				</div>
				<!--------end-logo--------->

				<!----start-nav-------->
				<div class="nav">
					<ul>

						<li class="active"><a href="#home" class="scroll">Home</a></li>
						<li><a href="#portfolio" class="scroll">Αναζητηση</a></li>
						<li><a href="#about" class="scroll">Σχετικα με εμας</a></li>
						<li><a href="#contact" class="scroll">Eπικοινωνια</a></li>
						<li><a href="#map" class="scroll">Χαρτης</a></li>
						<li><g:render template="/common/topbar" /></li>
						<div class="clear"></div>
					</ul>

				</div>
				<!-----end-nav-------->

				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!------end-header------------>
	<!-- start slider -->
	<div class="slider_bg">
		<div class="wrap">
			<!-------start-da-slider-->
			<div class="da-slide">
				<h2>
					<span>Είμαστε το</span> Prisma
				</h2>
				<p>H διαδικτυακή διακυβέρνηση στα καλύτερά της</p>
				<a href="#portfolio" class="da-link scroll">Αναζητηση</a> <a
					href="#portfolio" class="scroll"> <span class="da-img">
				</span>
				</a>
			</div>
			<!---//End-da-slider---->
		</div>
	</div>
	<!-----end-slider-------->
	<!--start portfolio------>
	<div>
		<div class="wrap" id="portfolio">
			<div class="main">
				<!-- start gallery  -->
				<div class="gallery1">
					<!---start-content---->
					<div class="gallery">
						<div class="clear"></div>
						<g:formRemote id="searchForm" name="full_search"
							url="[controller:'search', action:'searchfull']" update="results"
							onComplete="hideDecisionShowResults();">
							<div class="container">
								<h2>Αναζήτηση</h2>
								<p>Πραγματοποιήστε σύνθετες αναζητήσεις, αναλόγως τι
									ψάχνετε.</p>
								<div class="search_table">
									<script type="text/javascript">
										function clearAll() {
											document.getElementById(
													"searchForm").reset();
											<g:remoteFunction controller="ajax" action="clearGlobal"/>
											document
													.getElementById("portfoliolist").style["display"] = "inline-block";
										}
										function hideResultsShowDecision() {
											document.getElementById("results").style["display"] = "none";
											document.getElementById("decision").style["display"] = "block";
										}

										function hideDecisionShowResults() {
											document.getElementById("results").style["display"] = "block";
											document.getElementById("decision").style["display"] = "none";
										}
									</script>
									<ul id="filters" class="clearfix">
										<li><span class="filter" data-filter="ada"
											onClick="clearAll();">ΑΔΑ</span></li>
										<li><span class="filter"
											data-filter="prot_num unit org signer fromDate toDate"
											onClick="clearAll();">Ειδικη</span></li>
										<li><span class="filter"
											data-filter="subject type tag fromDate toDate"
											onClick="clearAll();">Γενικη</span></li>
										<li><span class="filter"
											data-filter="ada prot_num unit org signer subject type tag fromDate toDate"
											onClick="clearAll();">Πληρης</span></li>
										<li><g:submitButton class="search_button" name=" " /></li>
										<li><input type='reset' class="clear_button" value=' ' /></li>
										<li><div id="spinner" class="spinner"
												style="display: none;">
												<g:message code="spinner.alt" default="Loading&hellip;" />
											</div></li>
									</ul>

								</div>
								<div id=search_params>

									<div id="portfoliolist">
										<ul>
											<li><div class="portfolio ada" data-cat="ada">
													<label for="ada">ΑΔΑ:<br /></label>
													<g:textField name="ada" />
													<%--<div class="popup">some text here</div>
												--%>
												</div></li>
											<li><div class="portfolio prot_num" data-cat="prot_num">
													<label for="prot_num">Αριθμός Πρωτοκόλου:<br /></label>
													<g:textField name="prot_num" />
												</div></li>
											<li><div class="portfolio unit" data-cat="unit">
													<label for="unit">Μονάδα:</label>
													<richui:autoComplete name="unit"
														action="${createLinkTo('dir': 'ajax/unitAJAX')}"
														onItemSelect="${remoteFunction(controller: 'ajax' , action: 'selUn', params: '\'id=\' + id')}" />
												</div></li>
											<li><div class="portfolio org" data-cat="org">
													<label for="org">Οργανισμός:</label>
													<g:select id="org" class="dropdownMenu" name="org"
														from="${['Δήμος Θεσσαλονίκης','Αποκεντρωμένη Διοίκηση Μακεδονίας – Θράκης']}"
														noSelection="${[null: 'Επιλέξτε Οργανισμό']}" />
												</div></li>
											<li><div class="portfolio signer" data-cat="signer">
													<label for="signer">Τελικός Υπογράφων:</label>
													<richui:autoComplete name="signer"
														action="${createLinkTo('dir': 'ajax/signerAJAX')}" />
												</div></li>
											<li><div class="portfolio subject" data-cat="subject">
													<label for="subject">Θέμα:<br /></label>
													<g:textField name="subject" />
												</div></li>
											<li><div class="portfolio type" data-cat="type">
													<label for="type">Τύπος Απόφασης:</label>
													<richui:autoComplete name="type"
														action="${createLinkTo('dir': 'ajax/typeAJAX')}" />
												</div></li>
											<li><div class="portfolio tag" data-cat="tag">
													<label for="tag">Θεματική Ενότητα:</label>
													<richui:autoComplete name="tag"
														action="${createLinkTo('dir': 'ajax/tagAJAX')}" />
												</div></li>
											<li><div id="fromDate" class="portfolio fromDate"
													data-cat="fromDate">
													<label for="fromDate">Από Ημερομηνία:<br /></label>
													<g:datePicker id="datePicker" name="fromDate"
														precision="day" noSelection="['':'-No Selection-']"
														default="none"
														years="${Calendar.instance.get(Calendar.YEAR)..2010}" />
												</div></li>
											<li><div id="toDate" class="portfolio toDate"
													data-cat="toDate">
													<label for="toDate">Έως Ημερομηνία<br /></label>
													<g:datePicker id="datePicker" class="dropdownMenu"
														name="toDate" precision="day"
														noSelection="['':'-No Selection-']" default="none"
														years="${Calendar.instance.get(Calendar.YEAR)..2010}" />
												</div></li>
											<li><input name="pageId" type="hidden" value="home" /></li>
										</ul>
									</div>
									<div id="results"></div>
									<div id="decision"></div>
								</div>


							</div>

						</g:formRemote>

					</div>
					<!-- container -->
					<%--<script type="text/javascript"
						src="${resource(dir: 'js', file: 'fliplightbox.min.js')}"></script>
					<script type="text/javascript">
						$('body').flipLightBox()
					</script>

					--%><div class="clear"></div>

				</div>

			</div>

		</div>

	</div>
	<!---End-gallery----->
	<!-----start-about-------->

	<div class="about" id="about">
		<div class="wrap">
			<h2>Τι είναι το Prisma</h2>
			<p>Με το Prisma θέλουμε να δόσουμε την δυνατότητα στον πολίτη να
				είναι μέρος της διακυβέρνησης του τόπου του.</p>
			<div class="about-grids">
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'slider_image_ody.jpg')}">
					</div>
					<div class="desc">
						<h3>Η δύναμη του Δήμου</h3>
						<p>είσαι μέρος του</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>

				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'justice.jpg')}">
					</div>
					<div class="desc">
						<h3>Η δύναμη της Δικαιοσύνης</h3>
						<p>είσαι γρανάζι της</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>
				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'hands.png')}">
					</div>
					<div class="desc">
						<h3>Η δύναμη της Δημοκρατίας</h3>
						<p>είσαι ηλίθιος</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!---------end-about------------>

	<!---------start-contact------------>
	<div class="contact" id="contact">
		<div class="wrap">
			<h2>Επικοινωνία</h2>
			<h4>Βοηθήστε μας να γίνουμε καλύτεροι. Στείλτε μας τις προτάσεις και
				τα σχόλιά σας.</h4>
			<div class="section group">
				<div class="col span_2_of_3">
					<div class="contact-form">
						<g:formRemote id="contactForm" name="contact_form"
							url="[controller:'Maincontact', action:'index']"
							onComplete="pop();" update="contact_resp">

							<input name="name" type="text" class="textbox"
								value="Ονοματεπώνυμο" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Ονοματεπώνυμο';}" />
							<input name="email" type="text" class="textbox" value="Email"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Email';}" />
							<script type="text/javascript">
								function pop() {
									$('#contact_resp').fadeIn('slow');
									$('#contact_resp').delay(2000).fadeOut(
											'slow');
								}
							</script>

							<%--<g:textField name="email" type="text" class="textbox"
								value="Your Email" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your Email';}" />
							--%>
							<div class="clear"></div>

							<div>
								<textarea name="message" value="Το μήνυμά σας:"
									onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = 'Το μήνυμά σας...';}">Το μήνυμά σας...</textarea>
							</div>
							<%--<span><input type="submit" class="" value="Submit"></span>
							--%>
							<div>
								<span id="contact_resp" style="display: none;"></span> <span><g:submitButton
										name="Submit" type="submit" class="" value="Αποστολη" /></span>
							</div>
							<div class="clear"></div>
						</g:formRemote>
					</div>
				</div>
				<div class="col span_1_of_3">
					<div class="company_address">
						<h5>INFORMATION</h5>
						<ul class="list3">
							<li><img
								src="${resource(dir: 'images', file: 'location.png')}" alt="" />
								<div class="extra-wrap">
									<p>Lorem ipsum consectetu</p>
									<p>12345-Lorem ipsum consectetu</p>
									<p>Lorem ipsum , consectetu</p>
								</div>
								<div class="clear"></div></li>

							<li><img src="${resource(dir: 'images', file: 'phone.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>+1 800(Phone) 258 2598</p>
								</div>
								<div class="clear"></div></li>
							<li><img src="${resource(dir: 'images', file: 'fax2.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>+1 500(Tax) 6343 8690</p>
								</div>
								<div class="clear"></div></li>
							<li><img src="${resource(dir: 'images', file: 'mail.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>
										<a href="mailto:info@mycompany.com"> info(at)appstore.com</a>
									</p>
								</div>
								<div class="clear"></div></li>
						</ul>
					</div>
				</div>

				<div class="clear"></div>


			</div>

		</div>

	</div>

	<!---------start-map------------>
	<div id="map">
		<script type="text/javascript">
			<g:remoteFunction controller="map" action="homepage" update="mapView"/>
			</script>
		<div id="mapView"></div>		
	</div>
	<!---------end-map------------>

	<!----start-footer---------->
	<div class="footer-bottom">
		<div class="wrap">
			<%--<div class="copy">
				<p class="copy">
					&#169 2014 Template by <a href="http://w3layouts.com"
						target="_blank">w3layouts</a>
				</p>
			</div>
			
			
			--%>
			<g:render template="/common/footer" />
			<script type="text/javascript">
				$(document).ready(function() {

					var defaults = {
						containerID : 'toTop', // fading element id
						containerHoverID : 'toTopHover', // fading element hover id
						scrollSpeed : 1200,
						easingType : 'linear'
					};

					$().UItoTop({
						easingType : 'easeOutQuart'
					});

				});
			</script>
			<a href="#" id="toTop" style="display: block;"><span
				id="toTopHover" style="opacity: 1;"> </span></a>
			<script src="${resource(dir: 'js', file: 'jquery.scrollTo.js')}"></script>
		</div>
	</div>
	<!------end-footer------------>

</body>
</html>