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
			</head>
			<body>

				<!-- ***** Preloader Start ***** -->
				<div id="preloader">
					<div class="jumper">
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
				<!-- ***** Preloader End ***** -->

				<!-- Header -->
				<header class="">
					<nav class="navbar navbar-expand-lg">
						<div class="container">
							<a class="navbar-brand" href="index.html">
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
						<h1>Products Page</h1>
					</xsl:when>
					<xsl:when test="$TipoMenu=2">
						<h1>Us Page</h1>
					</xsl:when>
					<xsl:when test="$TipoMenu=3">
						<h1>Contact Page</h1>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"/>
					</xsl:otherwise>
				</xsl:choose>

				<!-- Bootstrap core JavaScript -->
				<script src="vendor/jquery/jquery.min.js"></script>
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


			</body>
			<!-- Footer -->
			<footer>
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
		</html>
	</xsl:template>

	<xsl:template name="Home">
		<!-- HOMEPAGE -->
		<!-- Page Content -->
		<!-- Banner Starts Here -->
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
	</xsl:template>


</xsl:stylesheet>
