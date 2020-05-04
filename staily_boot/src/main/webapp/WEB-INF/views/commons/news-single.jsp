<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>

<%@ include file="/WEB-INF/views/include/include_navbar.jsp"%>
		<!-- Wrapper -->
		<div class="wrapper">

			<!-- Hero -->
			<div id="content_hero" style="background-image: url(http://via.placeholder.com/1440x435)">
				
				<img src="images/scroll-arrow.svg" alt="Scroll down" class="scroll" />

				<!-- Content -->
				<div class="container">
					<div class="row blurb scrollme animateme" data-when="exit" data-from="0" data-to="1" data-opacity="0" data-translatey="100">
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
					<div class="col-sm-7">
						<article>
							<img src="http://via.placeholder.com/750x350" class="news-single-img" alt="" />
							<span class="categories">New releases, What's hot</span>
							<h2 class="no-underline">15 Tips To Increase Your Adwords Profits</h2>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

							<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

							<blockquote>Humanitatis per seacula quarta decima et quinta decima eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</blockquote>

							<p>Vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>

							<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

							<div class="bordered">
								<div class="single-tags">
									<i class="material-icons">label</i> <a href="#">Animation</a>, <a href="#">Movie nights</a>, <a href="#">Kids</a>
								</div>
								<div class="social-share">
									<a href="#">
										Share this
										<i class="material-icons">share</i>
									</a>
									<div class="share">
										<a href="#">
											<i class="fa fa-facebook"></i>
										</a>
										<a href="#">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#">
											<i class="fa fa-pinterest"></i>
										</a>
										<a href="#">
											<i class="fa fa-google-plus"></i>
										</a>
									</div>
								</div>
							</div>

							<div class="news-comments">
								<h3>2 Comments</h3>
								<div class="single-comment">
									<img src="images/avatar.png" class="Luke Barrett" />

									<span class="date">February 2, at 2:34pm</span>
									<h4 class="no-underline">Luke Barrett</h4>
									<p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.</p>
								</div>
								<div class="single-comment">
									<img src="images/avatar.png" class="Luke Barrett" />

									<span class="date">February 2, at 2:34pm</span>
									<h4 class="no-underline">Luke Barrett</h4>
									<p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.</p>
								</div>
							</div>

							<div class="news-comment-form">
								<h3>Leave a comment</h3>
								<form>
									<div class="form-group half">
										<label>Name *</label>
										<input type="text" />
									</div>
									<div class="form-group half">
										<label>Email *</label>
										<input type="email" />
									</div>
									<div class="form-group">
										<label>Website</label>
										<input type="text" />
									</div>
									<div class="form-group">
										<label>Comments *</label>
										<textarea rows="5"></textarea>
									</div>
									<div class="form-group right-align">
										<button class="btn btn-ghost">Post comment</button>
									</div>
								</form>
							</div>

						</article>
					</div>
					<aside class="col-sm-3 col-sm-push-1 sidebar">
						<div class="widget">
							<form>
								<input type="text" placeholder="Search..." class="search" />
								<i class="material-icons">search</i>
							</form>
						</div>
						<div class="widget">
							<h3>Categories</h3>
							<ul>
								<li><a href="#">Coming soon</a></li>
								<li><a href="#">New releases</a></li>
								<li><a href="#">What's hot</a></li>
								<li><a href="#">Events</a></li>
							</ul>
						</div>
						<div class="widget">
							<h3>Archives</h3>
							<ul>
								<li><a href="#">July 2017</a></li>
								<li><a href="#">June 2017</a></li>
								<li><a href="#">May 2017</a></li>
								<li><a href="#">April 2017</a></li>
							</ul>
						</div>
						<div class="widget">
							<h3>Tags</h3>
							<a href="#" class="tag">Thriller</a>
							<a href="#" class="tag">Kids</a>
							<a href="#" class="tag">Offers</a>
							<a href="#" class="tag">Movie nights</a>
							<a href="#" class="tag">Premiere</a>
							<a href="#" class="tag">Animation</a>
							<a href="#" class="tag">Comedy</a>
							<a href="#" class="tag">New</a>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/include_js.jsp" %>
	</body>
</html>