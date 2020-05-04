<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Movie Star - Cinema HTML Template</title>
		<link rel="icon" type="image/png" href="images/favicon.png" />
		<link href="css/slick.css" rel="stylesheet">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/venobox.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700" rel="stylesheet">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!--[if IE 9]>
			<link href="css/ie9.css" rel="stylesheet">
		<![endif]-->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		
		<!-- Wrapper -->
		<div class="wrapper">

			<!-- Navigation -->
			<div class="navbar" role="navigation">
				<!-- Heading -->
				<div class="heading">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="search">
									<a href="#">
										<i class="material-icons">search</i>
									</a>
								</div>
								<div class="tel">
									<a href="tel:03301234567">
										<i class="material-icons">phone in talk</i> 0330  123 4567
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="navbar-header">
						<a href="index.html" class="logo" title="Movie star landing page">
							<img src="images/logo.svg" alt="Movie star HTML Template">
						</a>
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar top-bar"></span>
							<span class="icon-bar middle-bar"></span>
							<span class="icon-bar bottom-bar"></span>
						</button>
					</div>  
					<div class="navbar-collapse collapse">
						<ul id="menu-primary" class="nav navbar-nav">
							<li>
									<a href="index.html">Home</a>
							</li>
							<li class="active">
								<a href="whats-on.html">What's on</a>
							</li>
							<li>
								<a href="shortcodes.html">Shortcodes</a>
							</li>
							<li class="dropdown">
								<a href="news.html">News</a>
								<ul class="dropdown-menu">
									<li><a href="news-single.html">News single</a></li>
								</ul>
							</li>
							<li>
								<a href="contact.html">Contact</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Hero -->
			<div id="content_hero" style="background-image: url(http://via.placeholder.com/1440x435)">
				
				<!-- Content -->
				<div class="container">
					<div class="row blurb scrollme animateme" data-when="exit" data-from="0" data-to="1" data-opacity="0" data-translatey="100">
						<div class="col-md-9">
							<span class="title">Take a look at</span>
							<h1>What's on this week</h1>
						</div>
					</div>
				</div>

			</div>

			<!-- Section -->
			<div class="container section negative-margin">
				<div class="row">
					<div class="col-sm-12">

						<div class="live-search">
							<input type="text" id="search" placeholder="Type to search">
							<i class="material-icons">search</i>
						</div>

						<div class="tabs movies">
							<ul>
								<li><a href="#mon">Mon</a></li>
								<li><a href="#tue">Tue</a></li>
								<li><a href="#wed">Today</a></li>
								<li><a href="#thu">Thu</a></li>
								<li><a href="#fri">Fri</a></li>
								<li><a href="#sat">Sat</a></li>
								<li><a href="#sun">Sun</a></li>
								<li class="date"><span>Wednesday, 8 March</span></li>
							</ul>
							<div id="mon">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="tue">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="wed">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="thu">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="fri">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="sat">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="sun">
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Sci-Fi </span>
										<h3 class="no-underline">Days of war</h3>
										<p>Steve Rogers, a rejected military soldier transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time">16:00</span> 
												<span class="time">18:00</span> 
												<span class="time">21:00</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												120 mins <span class="certificate">PG</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Action, Adventure, Fantasy</span>
										<h3 class="no-underline">End of an era</h3>
										<p>European mercenaries searching for black powder become embroiled in the defense of End of an era of China against a horde of monstrous creatures.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">14:45</span> 
												<span class="time">18:30</span> 
												<span class="time">20:30</span> 
												<span class="time">24:45</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												105 mins <span class="certificate">15</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">As she sleeps</h3>
										<p>A chronicle of the childhood, adolescence and burgeoning adulthood of a young black man growing up in a rough neighborhood of Miami.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">11:00</span> 
												<span class="time past">14:30</span> 
												<span class="time">20:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												117 mins <span class="certificate">U</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row movie-tabs">
									<div class="col-md-2 col-sm-3">
										<a href="single-movie.html">
											<img src="http://via.placeholder.com/265x340" alt="Movie title" />
										</a>
									</div>
									<div class="col-md-10 col-sm-9">
										<span class="title">Drama</span>
										<h3 class="no-underline">The apocalypse</h3>
										<p>A working-class African-American father tries to raise his family in the 1950s, while coming to terms with the events of his life.</p>
										<p><a href="news-single.html" class="arrow-button">Full synopsis</a></p>

										<div class="row">
											<div class="col-md-8 col-sm-9">
												<hr class="space-10" />
												<span class="viewing-times">
													<i class="material-icons">access_time</i>
													Viewing times
												</span>

												<span class="time past">10:00</span> 
												<span class="time past">12:45</span> 
												<span class="time">17:00</span> 
												<span class="time">21:15</span> 
											</div>
											<div class="col-md-4 col-sm-3 running-time">
												<hr class="space-10" />
												135 mins <span class="certificate">18</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp"%>
</html>