<%@include file="./shared/navigation.jsp"%>




<div class="container">

	<div class="row">


		<div id="myCarousel"
			class="carousel slide bg-inverse  w-100 ml-auto mr-auto"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${images}/download.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${images}/laptop2.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${images}/Laptop.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<br />
		<div class="row">

			<h3>Popular Products</h3>
		</div>

		<div class="row">

			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="${images}/products/5.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="${contextRoot}/singleproduct${5}">Sony Bravia</a>
						</h4>
						<h5>
							<i class="fa fa-inr" aria-hidden="true"></i> 55000
						</h5>
						<p class="card-text">Boring TV sets that let you just watch
							regular TV channels are so yesterday. Upgrade your entertainment
							system with this Sony Bravia LED TV. It features USB and HDMI
							ports which let you connect external devices to your TV. When
							you’re bored of watching the TV, simply tune into your favourite
							radio stations - yes, this TV has built-in FM radio.</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
							&#9734;</small>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="${images}/products/6.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="${contextRoot}/singleproduct${6}">Dell Inspiron Core i3 6th Gen</a>
						</h4>
						<h5>
							<i class="fa fa-inr" aria-hidden="true"></i> 60000
						</h5>
						<p class="card-text">
							Intel Core i3 Processor (6th Gen) 4 GB<br /> DDR4 RAM <br />Linux/Ubuntu
							Operating System<br /> 1 TB HDD <br />14 inch Display.
						</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
							&#9734;</small>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="${images}/products/7.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="${contextRoot}/singleproduct${7}">Skullcandy S5LHZ</a>
						</h4>
						<h5>
							<i class="fa fa-inr" aria-hidden="true"></i> 3000
						</h5>
						<p class="card-text">Design: Over the Head <br/> Type: Stereo <br/>
							Compatible With: Mobile Headphone Jack: 3.5 Over the Ear Wired
							Connectivity 24 ohm Impedance</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">&#9733; &#9733; &#9733; &#9733;
							&#9734;</small>
					</div>
				</div>
			</div>


		</div>
		<!-- /.row -->

	</div>
	<!-- /.col-lg-9 -->

</div>
<!-- /.row -->

</div>
<!-- /.container -->


<%@include file="./shared/footer.jsp"%>