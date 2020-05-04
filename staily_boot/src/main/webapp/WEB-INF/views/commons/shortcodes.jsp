<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include_css.jsp"%>
<%@ include file="/WEB-INF/views/include/include_js.jsp"%>
<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>
<%@ include file="/WEB-INF/views/include/tags.jspf"%>

<html>
<head>
</head>
<!-- Hero -->
<div id="content_hero"
	style="background-image: url(http://via.placeholder.com/1440x435)">

	<img src="images/scroll-arrow.svg" alt="Scroll down" class="scroll" />

	<!-- Content -->
	<div class="container">
		<div class="row blurb scrollme animateme" data-when="exit"
			data-from="0" data-to="1" data-opacity="0" data-translatey="100">
			<div class="col-md-9">
				<span class="title">The very latest</span>
				<h1>Cinema news</h1>
			</div>
		</div>
	</div>

</div>

<!-- Section -->
<div class="container section news">
	<div class="row">
		<div class="col-sm-12">
			<h2>Box icons</h2>
			<hr class="space-40" />
			<div class="row">
				<div class="col-sm-4">
					<div class="icon-box">
						<i class="material-icons">timelapse</i>
						<h4>Box icon title</h4>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="icon-box">
						<i class="material-icons">movie</i>
						<h4>Box icon title</h4>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="icon-box">
						<i class="material-icons">camera roll</i>
						<h4>Box icon title</h4>
						<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
							sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
							aliquam erat volutpat.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Section -->
<div class="container section news">
	<div class="row">
		<div class="col-sm-12">
			<h2>Row icons</h2>
			<hr class="space-40" />
			<div class="row">
				<div class="col-sm-4">
					<div class="icon-row">
						<div class="col">
							<span class="circle"> <i class="material-icons">collections</i>
							</span>
						</div>
						<div class="col">
							<h4>Box icon title</h4>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
								sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
								aliquam erat volutpat.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="icon-row">
						<div class="col">
							<span class="circle"> <i class="material-icons">grade</i>
							</span>
						</div>
						<div class="col">
							<h4>Box icon title</h4>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
								sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
								aliquam erat volutpat.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="icon-row">
						<div class="col">
							<span class="circle"> <i class="material-icons">security</i>
							</span>
						</div>
						<div class="col">
							<h4>Box icon title</h4>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
								sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
								aliquam erat volutpat.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Section -->
<div class="container section news">
	<div class="row">
		<div class="col-sm-12">
			<h2>News carousel</h2>
			<hr class="space-40" />
			<div class="row">
				<div class="col-sm-12">

					<div class="slick-carousel news-carousel">
						<div>
							<div class="movie-poster">
								<aside>
									<div>
										<a href="#" class="play"> <i class="material-icons">link</i>
										</a> <a href="single-movie.html" class="read-more">read more</a>
									</div>
								</aside>
								<a href="#"> <img src="http://via.placeholder.com/360x225"
									alt="Lorem ipsum delor sit amet">
								</a>
							</div>
							<span class="date">8 March, 2017</span>
							<h4>Lorem ipsum delor sit amet</h4>
							<p>Classified advertising is a form of advertising that is
								particularly common in newspapers and other periodicals.</p>
						</div>
						<div>
							<div class="movie-poster">
								<aside>
									<div>
										<a href="#" class="play"> <i class="material-icons">link</i>
										</a> <a href="single-movie.html" class="read-more">read more</a>
									</div>
								</aside>
								<a href="#"> <img src="http://via.placeholder.com/360x225"
									alt="Lorem ipsum delor sit amet">
								</a>
							</div>
							<span class="date">2 March, 2017</span>
							<h4>Lorem ipsum delor sit amet</h4>
							<p>Classified advertising is a form of advertising that is
								particularly common in newspapers and other periodicals.</p>
						</div>
						<div>
							<div class="movie-poster">
								<aside>
									<div>
										<a href="#" class="play"> <i class="material-icons">link</i>
										</a> <a href="single-movie.html" class="read-more">read more</a>
									</div>
								</aside>
								<a href="#"> <img src="http://via.placeholder.com/360x225"
									alt="Lorem ipsum delor sit amet">
								</a>
							</div>
							<span class="date">14 February, 2017</span>
							<h4>Lorem ipsum delor sit amet</h4>
							<p>Classified advertising is a form of advertising that is
								particularly common in newspapers and other periodicals.</p>
						</div>
						<div>
							<div class="movie-poster">
								<aside>
									<div>
										<a href="#" class="play"> <i class="material-icons">link</i>
										</a> <a href="single-movie.html" class="read-more">read more</a>
									</div>
								</aside>
								<a href="#"> <img src="http://via.placeholder.com/360x225"
									alt="Lorem ipsum delor sit amet">
								</a>
							</div>
							<span class="date">2 March, 2017</span>
							<h4>Lorem ipsum delor sit amet</h4>
							<p>Classified advertising is a form of advertising that is
								particularly common in newspapers and other periodicals.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Section -->
<div class="container section news">
	<div class="row">
		<div class="col-sm-12">
			<h2>Tabs</h2>
			<hr class="space-40" />
			<div class="row">
				<div class="col-sm-5">
					<div class="tabs">
						<ul>
							<li><a href="#one">Tab 1</a></li>
							<li><a href="#two">Tab 2</a></li>
							<li><a href="#three">Tab 3</a></li>
						</ul>
						<div id="one">
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>

							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>
						</div>
						<div id="two">
							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>

							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>
						</div>
						<div id="three">
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>
							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<div class="tabs pill-style">
						<ul>
							<li><a href="#one">Tab 1</a></li>
							<li><a href="#two">Tab 2</a></li>
							<li><a href="#three">Tab 3</a></li>
						</ul>
						<div id="one">
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>

							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>
						</div>
						<div id="two">
							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>

							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>
						</div>
						<div id="three">
							<p>Typi non habent claritatem insitam; est usus legentis in
								iis qui facit eorum claritatem. Investigationes demonstraverunt
								lectores legere me lius quod ii legunt saepius.</p>
							<p>Claritas est etiam processus dynamicus, qui sequitur
								mutationem consuetudium lectorum. Mirum est notare quam littera
								gothica, quam nunc putamus parum claram, anteposuerit litterarum
								formas humanitatis per seacula quarta decima et quinta decima.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Section -->
<div class="container section news">
	<div class="row">
		<div class="col-sm-12">
			<h2>Accordion</h2>
			<hr class="space-40" />
			<div class="row">
				<div class="col-sm-5">
					<div class="accordion">
						<h3>Astronomy Or Astrology</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>The Amazing Hubble</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>Vacation Home Rental Success</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>When The Morning Dawns</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-5 col-sm-push-2">
					<div class="accordion pill-style">
						<h3>Astronomy Or Astrology</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>The Amazing Hubble</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>Vacation Home Rental Success</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
						</div>
						<h3>When The Morning Dawns</h3>
						<div>
							<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
								quam. Integer ut neque. Vivamus nisi metus, molestie vel,
								gravida in, condimentum sit amet, nunc. Nam a nibh. Donec
								suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur
								malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
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