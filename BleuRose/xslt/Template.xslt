<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>

	<xsl:template match="Menu">
		<html lang ="en">
			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
				<meta name="description" content=""/>
				<meta name="author" content=""/>
				<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet"/>
				<title>BLEUROSE Clothing</title>

				<!-- Bootstrap core CSS -->
				<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
				<!--

TemplateMo 546 Sixteen Clothing

https://templatemo.com/tm-546-sixteen-clothing

-->

				<!-- Additional CSS Files -->
				<link rel="stylesheet" href="assets/css/fontawesome.css"/>
				<link rel="stylesheet" href="assets/css/templatemo-sixteen.css"/>
				<link rel="stylesheet" href="assets/css/owl.css"/>

				<script src="vendor/jquery/jquery.min.js"></script>

				<!-- Bootstrap core JavaScript -->

				<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


				<!-- Additional Scripts -->
				<script src="assets/js/custom.js"></script>
				<script src="assets/js/owl.js"></script>
				<script src="assets/js/slick.js"></script>
				<script src="assets/js/isotope.js"></script>
				<script src="assets/js/accordions.js"></script>


				<script language = "text/Javascript">
					cleared[0] = cleared[1] = cleared[2] = 0; <!--set a cleared flag for each field-->
					function clearField(t){   <!--declaring the array outside of the-->
					if(! cleared[t.id]){                      <!--function makes it static and global-->
					cleared[t.id] = 1;   <!--you could use true and false, but that's more typing-->
					t.value='';         <!--with more chance of typos-->
					t.style.color='#fff';
					}
					}
				</script>
			</head>
			<body>
				
								
							
				<div class="page-container">
					<!-- ***** Preloader Start ***** -->
					<div id="preloader">
						<div class="jumper">
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>
					<!-- ***** Preloader End ***** -->

					<!-- Header , navbar -->
					<header class="">
						<nav class="navbar navbar-expand-lg">
							<div class="container">
								<a class="navbar-brand" href="{Opciones/Opcion/@Url[1]}">
									<h2>
										<xsl:value-of select="substring(Datos/Empresa,1,4)"/>
										<em>
											<xsl:value-of select="substring(Datos/Empresa,5,4)"/>
										</em>
									</h2>
								</a>
								<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbarResponsive">
									<ul class="navbar-nav ml-auto">
										<xsl:for-each select="Opciones/Opcion">
											<!--equivalente SWITCH-->
											<li class="nav-item ">
												<xsl:choose>
													<!--equivalente IF-->
													<xsl:when test="$TipoMenu=@Id">
														<a class="nav-link active" href="{@Url}">
															<xsl:value-of select="@Texto"/>
															<span class="sr-only">(current)</span>
														</a>
													</xsl:when>
													<xsl:otherwise>
														<a class="nav-link" href="{@Url}">
															<xsl:value-of select="@Texto"/>

														</a>
													</xsl:otherwise>
												</xsl:choose>
											</li>
										</xsl:for-each>
									</ul>
								</div>
							</div>
						</nav>
					</header>

					<!-- Choose para mostrar dinámicamente el contenido de cada opcion del menú-->
					<xsl:choose>
						<xsl:when test="$TipoMenu=1">
							<xsl:call-template name="Products"/>
						</xsl:when>
						<xsl:when test="$TipoMenu=2">
							<xsl:call-template name="Us"/>
						</xsl:when>
						<xsl:when test="$TipoMenu=3">
							<xsl:call-template name="Contact"/>
						</xsl:when>
						<xsl:when test="$TipoMenu=4">
							<xsl:call-template name="Extras"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Home"/>
						</xsl:otherwise>
					</xsl:choose>

					<!-- Footer -->
					<footer id="">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="inner-content">
										<p>
											Copyright 2080 BleuRose Co., Ltd.
										</p>
									</div>
								</div>
							</div>
						</div>
					</footer>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="Home">
		<!-- HOMEPAGE -->
		<!-- Page Content -->
		<!-- Banner Starts Here -->
		<audio src="/assets/media/wl.mp3" autoplay="true"/>
		<div class="page-container">
			<div class="banner header-text">
				<div class="owl-banner owl-carousel">
					<!-- Iterar para mostrar los elementos del carrusel-->
					<xsl:for-each select="Items/Item">
						<div class="banner-item-01">
							<div class="text-content">
								<h4>
									<xsl:value-of select="@Nombre"/>
								</h4>
								<h2>
									<xsl:value-of select="@Descripción"/>
								</h2>
							</div>
						</div>

					</xsl:for-each>
				</div>
			</div>
			<!-- Banner Ends Here -->

			<div class="latest-products">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="section-heading">
								<h2>Últimos Productos</h2>
								<!--<a href="products.html">
								view all products <i class="fa fa-angle-right"></i>
							</a>-->
							</div>
						</div>
						<!-- Iterar para mostrar los items (Last Products)-->
						<xsl:for-each select="Prendas/Tipo">
							<div class="col-md-4">
								<div class="product-item">
									<a href="#">
										<img src="{Prenda/Imagen}" alt=""/>
									</a>
									<div class="down-content">
										<a href="#">
											<h4>
												<xsl:value-of select="Prenda/@Nombre"/>
											</h4>
										</a>
										<div class="">
											<h6>
												<xsl:value-of select="Prenda/Precio"/>
											</h6>
										</div>
										<p>
											<xsl:value-of select="Prenda/Descripcion"/>
										</p>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</div>
			<!-- "About"-->
			<div class="best-features">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="section-heading">
								<h2>Acerca de Bleu Rose</h2>
							</div>
						</div>
						<div class="col-md-6">
							<div class="left-content">
								<h4>Buscando los mejores productos?</h4>
								<p>
									Somos una empresa mexicana con productos 100% mexicanos y materia prima local dedicada a la elaboración de ropa para invierno.
								</p>
								<ul class="featured-list">
									<!-- iterar para pintar la lista -->
									<xsl:for-each select="Lista/Elemento">
										<li>
											<a >
												<xsl:value-of select="Titulo"/>
											</a>
										</li>
									</xsl:for-each>
								</ul>
								<a href="" class="filled-button">Leer Más</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="right-image">
								<img src="assets/images/feature-image.jpg" alt=""/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="Products">
		<audio src="/assets/media/ttl-wl.mp3" autoplay="true"/>
		<div class="">
			<div class="page-heading products-heading header-text">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="text-content">
								<h4>novedades</h4>
								<h2>Bleu Rose Productos</h2>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="products">
				<div class="container">
					<div class="row">
						<div class="col-md-12" id="{@Nombre}">
							<div class="filters">
								<ul>
									<!--Iterar para obtener los títulos de Categorías-->
									<xsl:for-each select="Prendas/Tipo">
										<li class="tipomenu active" data-filter="{@Nombre}" id="li{@Nombre}">
											<xsl:value-of select="@Nombre"/>
										</li>

									</xsl:for-each>
								</ul>
							</div>
						</div>
						<!--Iterar para mostrar los contenedores-->

						<xsl:for-each select="Prendas/Tipo">
							<div class="col-md-12 contenedores" id="{@Nombre}">
								<div class="filters-content">
									<div class="row grid">
										<div class="mydiv">
											<!--Iterar para mostrar las prenda seleccionada-->
											<xsl:for-each select="Prenda">
												<div class="items">
													<a href="#">
														<img class="imagenes" src="{Imagen}" alt=""/>
													</a>

													<div class="down-content">
														<a >
															<h4>
																<xsl:value-of select="@Nombre"/>
															</h4>
														</a>
														<h6>
															<xsl:value-of select="Precio"/>
														</h6>
														<p>
															<xsl:value-of select="Descripcion"/>.
														</p>
														<span>Reviews (12)</span>
													</div>
												</div>
											</xsl:for-each>
										</div>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function(){
			$("#liCalzado").addClass("active");
			$(".contenedores").hide();
			$("#Calzado").show();
			$(".tipomenu").click(function()
			{
			$(".contenedores").hide();
			var nombre = $(this).data("filter");
			$(".tipomenu").removeClass("active");
			$(this).addClass("active");
			$("#" + nombre).show();
			});
			});

		</script>


	</xsl:template>

	<xsl:template name="Us">
		<audio src="/assets/media/bigtv-wl.mp3" autoplay="true"/>
		<!--Heading-->
		<div class="page-heading about-heading header-text">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-content">
							<h4>SOMOS</h4>
							<h2>
								<xsl:value-of select="Datos/Empresa"/>
							</h2>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--Features-->
		<div class="best-features about-features">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h2>
								<xsl:value-of select="Datos/Empresa"/>
							</h2>
						</div>
					</div>
					<div class="col-md-6">
						<div class="right-image">
							<img src="assets/images/feature-image.jpg" alt=""/>
						</div>
					</div>
					<div class="col-md-6">
						<div class="left-content">
							<h4>Quienes somos y qué hacemos?</h4>
							<p>Somos una empresa orgullosamente mexicana con experiencia en el mercado con productos 100% mexicanos y materia prima local dedicada a la elaboración de ropa para invierno. Con la compra de nuestra materia prima a artesanos locales logramos impulsar la economía local y emplear cada vez más a más gente en el país.</p>
							<ul class="social-icons">
								<li>
									<a href="#">
										<i class="fa fa-facebook"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-linkedin"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-behance"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--Members-->
		<div class="team-members">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h2>Nuestro equipo</h2>
						</div>
					</div>
					<xsl:for-each select="Team/Members/Member">
						<div class="col-md-4">
							<div class="team-member">
								<div class="thumb-container">
									<img src="{Imagen}" alt=""/>
									<div class="hover-effect">
										<div class="hover-content">
											<ul class="social-icons">
												<li>
													<a href="#">
														<i class="fa fa-facebook"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-twitter"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-linkedin"></i>
													</a>
												</li>
												<li>
													<a href="#">
														<i class="fa fa-behance"></i>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="down-content">
									<h4>
										<xsl:value-of select="@Nombre"/>
									</h4>
									<span>
										<xsl:value-of select="Puesto"/>
									</span>
									<p>
										<xsl:value-of select="Descripcion"/>
									</p>
								</div>
							</div>
						</div>
					</xsl:for-each>
				</div>
			</div>
		</div>


		<!--Partners-->
		<div class="happy-clients">
			<form method="post" value=""></form>
		</div>

	</xsl:template>

	<xsl:template name="Contact">
		<audio src="/assets/media/imle-wl.mp3" autoplay="true"/>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>

		<script src="/assets/js/Geolocation.js"></script>
		<!-- Page Content -->
		<div class="page-heading contact-heading header-text">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-content">
							<h4>Contáctanos</h4>
							<h2>Ponte en contacto con nosotros!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Find Us -->
		<div class="find-us">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h2>Nuestra ubicación</h2>
						</div>
					</div>
					<div class="col-md-8">
						<!-- How to change your own map point
	1. Go to Google Maps
	2. Click on your location point
	3. Click "Share" and choose "Embed map" tab
	4. Copy only URL and paste it within the src="" field below
-->


						<div class="col-lg-6 col-md-6">
							<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
							<div id="google-map">
								<div class="pink-border" id="mapa">
								</div>

							</div>
						</div>

					</div>
				</div>
				<div class="col-md-4">
					<div class="left-content">
						<h4>Nuestra oficina</h4>
						<p id="direccion">
							<!--<xsl:value-of select="concat(Datos/Direccion,  'Tel: ', Datos/Telefono)"/>-->
						</p>
						<ul class="social-icons">
							<li>
								<a href="#">
									<i class="fa fa-facebook"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-twitter"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-linkedin"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-behance"></i>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="send-message">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h2>Mándanos un mensaje</h2>
						</div>
					</div>
					<div class="col-md-8">
						<div class="contact-form">
							<form id="contact" action="contacto.aspx" method="post">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<fieldset>
											<input name="name" type="text" class="form-control" id="name" placeholder="Nombre Completo" required="campo requerido"/>
										</fieldset>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12">
										<fieldset>
											<input name="email" type="email" class="form-control" id="email" placeholder="E-Mail" required="campo requerido"/>
										</fieldset>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12">
										<fieldset>
											<input name="subject" type="text" class="form-control" id="subject" placeholder="Asunto" required="campo requerido"/>
										</fieldset>
									</div>
									<div class="col-lg-12">
										<fieldset>
											<textarea name="message" rows="6" class="form-control" id="message" placeholder="Tu mensaje" required="campo requerido"></textarea>
										</fieldset>
									</div>
									<div class="col-lg-12">
										<fieldset>
											<button type="submit" id="form-submit" class="filled-button">Enviar Mensaje</button>
										</fieldset>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-4">
						<ul class="">
							<li>
								<a style="font-weight:bold;font-size:2rem;" href="{Opciones/Opcion/@Url[1]}">
									<xsl:value-of select="Datos/Empresa"/>
									<span style="font-size:1rem;color:pink;">Clothing Shop</span>
								</a>
								<div class="content">
									<img class="imagenes bluerose" src="{Datos/Imagen}"/>
								</div>
							</li>

						</ul>

						<div class="pink-border" id="street">
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function(){
			getGeo();
			dibujaMapa(19.0715921, -98.220233);
			});

		</script>
	</xsl:template>

	<xsl:template name="Extras">
		<script src="/assets/js/dragndrop.js"></script>
		<!-- Page Content -->
		<div class="page-heading contact-heading header-text">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-content">
							<h4>Contenido extra</h4>
							<h2>Bienvenido!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="find-us">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h2 style="font-weight:bold;">Arrastra tus productos al carrito!</h2>


						</div>
					</div>
					<div class="col-md-8">
						<!-- How to change your own map point
	1. Go to Google Maps
	2. Click on your location point
	3. Click "Share" and choose "Embed map" tab
	4. Copy only URL and paste it within the src="" field below
-->

						<p>
							Productos: <span id="agregados"></span>
						</p>
						<div class="col-lg-6 col-md-6">
							<div class="cont-dnd">


								<div class="pink-border">
									<div id="content" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return clonar(event)" class="carrito">
									</div>
								</div>

								<div id="cuadro" class="drag-div">

									<img id="arrastrable1" ondragstart="start(event)" ondragend="end(event)" draggable="true" class="imagenes-carrito" src="/assets/images/product_01.jpg"/>

									<img  id="arrastrable2" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_02.jpg" />

									<img id="arrastrable3" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_03.jpg" />

									<img id="arrastrable4" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_04.jpg" />

									<img id="arrastrable5" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_05.jpg" />

									<img id="arrastrable5" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_06.jpg" />

									<img id="arrastrable5" draggable="true" ondragstart="start(event)" ondragend="end(event)" class="imagenes-carrito" src="/assets/images/product_011.jpg" />

								</div>
							</div>

						</div>

					</div>
				</div>
				<div class="col-md-4">
					<div class="left-content">
						<h4></h4>
						<p style="font-weight:bold;font-size:2rem;margin-top:2rem;" id="direccion">
							<![CDATA[Video & póster]]> 
						</p>
						<div id="video">
							<video width="100%" controls="true" poster="assets/images/wrc.jpg">
								<source src="/assets/media/wrc.mp4">
								</source>
							</video>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
