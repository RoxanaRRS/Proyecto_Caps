<%@page language="java"%>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<div id="dialog" class= "col-xm-offset-1 col-xm-10">
	<div class="contenido" style="margin-left: 20px;"></div>
</div> 
<div class="row">
	<div id="breadcrumb" class="col-md-12">
		<ol class="breadcrumb">
			<li><a href="index.jsp">Inicio</a></li>
			<li><a href="#">Consumos</a></li>
			<li><a href="#">Consumos de los clientes</a></li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="box" style="top: 0px; left: 0px; opacity: 1;">

			<div class="box-header">
				<div class="box-name">
					<i class="fa fa-plus-square-o"></i> <span>Registro de
						Consumos</span>
				</div>
				<div class="box-icons">
					<a id="colapsar_desplegar1" class="collapse-link" onclick="validar(colap1);"> <i
						class="fa fa-chevron-up"></i></a> 
						<a id="expandir1" class="expand-link"  onclick="validar(expand1);"> 
						<i class="fa fa-expand"></i></a>
				</div>
				<div class="no-move"></div>
			</div>

			<div class="box-content">
				<form class="form-horizontal" role="form" id="defaultForm"
					method="POST" action="./SL_consumo">
					<input type="hidden" id="opcion" name="opcion" value="guardar">
					<input type="hidden" id="consumo_ID" name="consumo_ID"> 
					<input type="hidden" id="cliente_ID" name="cliente_ID"> 
					<input type="hidden" id="contrato_ID" name="contrato_ID">
					
					<h4 class="page-header"
						Style="text-align: center; font-size: xx-large;">Cliente</h4>

					<div class="form-group">

						<label class="col-sm-4 control-label">Nombres</label>
						<div class="col-sm-5">
							<input type="text" class="form-control"
								id="nombreClienteCompleto" placeholder="Nombres"
								data-toggle="tooltip" data-placement="bottom"
								title="Nombre completo">
						</div>
						<div class="col-sm-5 col-md-3">
							<button type="button" class="blue" id="abrir_modal">
								<span><i class="fa fa-search"></i></span> Buscar Cliente
							</button>
						</div>
					</div>
					<div class="form-group">
						<label for="numContrato" class="col-sm-4 control-label">Número
							del contrato</label>
						<div class="col-sm-4">
							<input type="text" id="numContrato" class="form-control"
								placeholder="contrato" id="numContrato">
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<label class="col-sm-4 control-label">Medidor</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="numMedidor" name="numMedidor"
								placeholder="medidor" data-toggle="tooltip" data-placement="top"
								title="numero de medidor">
						</div>
					</div>
					<h4 class="page-header"
						Style="text-align: center; font-size: xx-large;">Consumo</h4>
						
					<div class="form-group has-success has-feedback">
						<label class="col-sm-4 control-label">Lectura Actual</label>
						<div class="col-sm-5">
							<input data-bv-numeric="true" class="form-control" name="lectura"
								id="lectura_Actual" data-toggle="tooltip" data-placement="top"title="lectura de consumo">
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="form-group has-success has-feedback">
						<label class="col-sm-4 control-label">Fecha de corte</label>
						<div class="col-sm-5">
							<input type="text" id="fecha_fin" class="form-control"
								name="fecha" placeholder="Fecha de corte"><span
								class="fa fa-calendar txt-success form-control-feedback"></span>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="form-group has-success">
						<label class="col-sm-4 control-label">Consumo</label>
						<div class="col-sm-5">
							<!-- PARA DEJAR SIN USO A INPUT AGREGAR ATRIBUTO *disabled* -->
							<input type="text" class="form-control"
								placeholder="el consumo es un campo calculado"
								readonly="readonly" id="consumoTotal">
						</div>
					</div>

					
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-3">
							<button type="submit" class="btn btn-primary btn-label-left btn-lg"
							data-toggle='tooltip' "data-placement='bottom' title='guardar consumo' >
								<span><i class="fa fa-save"></i></span> Guardar
							</button>
						</div>
						<div class="col-sm-4">
							<button type="button"
								class="btn btn-default btn-label-left btn-lg"
								onclick="cancelar();">
								<span><i class="fa fa-reply txt-danger"></i></span> Cancelar
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name text-center">
					<i class="fa fa-th"></i> <span>Lista de consumos</span>
				</div>
				<div class="box-icons">
					<a id="colapsar_desplegar2" onclick="validar(colap2);" class="collapse-link"> 
						<i class="fa fa-chevron-up"></i> </a> 
					<a id="expandir2" onclick="validar(expand2);" class="expand-link"> 
						<i class="fa fa-expand"></i> </a>
				</div>
				<div class="no-move"></div>
			</div>
			<div class="box-content no-padding table-responsive">
				<table class="table  table-bordered table-striped table-hover table-heading table-datatable"
					id="tabla_consumo" style="width:100%;">
					<thead>
						<tr>
							<th>Fecha_Corte</th>
							<th>Lectura</th>
							<th>Consumo</th>
							<th>Nombres_Cliente</th>
							<th>Num_Contrato</th>
							<th>Num_medidor</th>
							<th></th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div>
	<form id="frmEliminarConsumo" action="" method="POST">
		<input type="hidden" id="consumo_id" name="consumo_id" value="">
		<input type="hidden" id="opcion" name="opcion" value="eliminar">

<!-- 		Modal -->
		<div id="modalbox">
			<div class="devoops-modal">
				<div class="devoops-modal-header">
					<div class="modal-header-name">
						<span>Basic table</span>
					</div>
					<div class="box-icons">
						<a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="devoops-modal-inner"></div>
				<div class="devoops-modal-bottom"></div>
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">

	var expand1 = new Expand1();//se crean los objetos que representan los botones de cada dialogo
	var colap1 =  new Colap1();
	var expand2 = new Expand2();
	var colap2 =  new Colap2();
	
	// Iniciar dataTables
	function AllTables() {
		//cargar PDF Y EXCEL
		$.getScript('plugins/datatables/nuevo/jszip.min.js', function(){
			$.getScript('plugins/datatables/nuevo/pdfmake.min.js',function(){
				$.getScript('plugins/datatables/nuevo/vfs_fonts.js',function(){
					console.log("PDF Y EXCEL cargado");
					iniciarTabla();
				});
			});
		});
		LoadSelect2Script(MakeSelect2);
	}
	
	function MakeSelect2() {
		$('select').select2();
	}
	
	var verResultado = function(r) {
		if(r == "BIEN"){
			mostrarMensaje("#dialog", "CORRECTO", 
					"¡Se realizó la acción correctamente, todo bien!", "#d7f9ec", "btn-info");
			limpiar_texto();
			$('#tabla_consumo').DataTable().ajax.reload();
		}
		if(r == "ERROR"){
			mostrarMensaje("#dialog", "ERROR", 
					"¡Ha ocurrido un error, no se pudó realizar la acción!", "#E97D7D", "btn-danger");
		}
		if(r =="VACIO"){
			mostrarMensaje("#dialog", "VACIO", 
					"¡No se especificó la acción a realizar!", "#FFF8A7", "btn-warning");
		}
		if(r =="ACTUALIZADO"){
			mostrarMensaje("#dialog", "ACTUALIZADO", 
					"¡Otro usuario a realizado un cambio, se actualizaron los datos!", "#86b6dd", "btn-primary");
			$('#tabla_OI').DataTable().ajax.reload();
		}
	}
	
	function abrirDialogo(callback) {
		OpenModalBox(
				"<div><h3>Borrar Consumo</h3></div>",
				"<p Style='text-align:center; color:salmon; font-size:x-large;'>Esta seguro de borrar este consumo?</p>",
				"<div Style='margin-bottom: -10px;' class='col-sm-12 col-md-offset-2 col-md-3'>"+
				"<button style='margin-left:-10px; color:#ece1e1;' type='button' id='eliminar_consumo' "+
				"class='btn btn-danger btn-label-left'>"+
				"<span style='margin-right:-6px;'><i class='fa fa-trash-o'></i></span>Borrar consumo</button>"+
				"<div style='margin-top: 5px;'></div> </div>"+
				"<div Style='margin-bottom: -10px;' class='col-sm-12 col-md-offset-1 col-md-4 text-center'>"+
				"<button type='button' class='btn btn-default btn-label-left' Style='margin-left:10px;' onclick='CloseModalBox()'>"+
				"<span><i class='fa fa-reply txt-danger'></i></span> Cancelar</button> </div>");
		callback();
	}
	
	var guardarConsumo = function() {
		$("form#defaultForm").on("submit", function(e) {
			e.preventDefault();//detiene el evento
			var frm = $(this).serialize();//parsea los datos del formulario
			console.log(frm);
			if($("form#defaultForm #lectura_Actual").val()!="" && $("form#defaultForm #fecha_fin").val()!=""
					&& $("form#defaultForm #numMedidor").val()!=""){
	 			$.ajax({//enviar datos por ajax
	 			type:"POST",
	 			url:"./SL_consumo",
	 			data: frm//datos a enviar
	 			}).done(function(info) {//informacion que el servlet le reenvia al jsp
	 			console.log(info);
	 			if(expand1.valor == true)
					validarExpand(expand1, "#expandir1");
			
				if(expand2.valor == true)
					validarExpand(expand2, "#expandir2");
				
				validarColap(colap1, "#colapsar_desplegar1");
				if (colap2.valor ==true){}else{
					validarColap(colap2, "#colapsar_desplegar2");
				}
				verResultado(info);//se envia a verificar que mensaje respondio el servlet	
	 			});
			}
		});
	}
	
	function filtrarTabla(){
		
		    $('#datatable-filter thead th label input').each( function () {
		        var title = $(this).attr("name");
		        $(this).attr("placeholder", "Buscar por " + title);
		    } );
		    var table = $('#datatable-filter').DataTable({
		    	"destroy": true,
		    	"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todo"]],
		    	"bJQueryUI": true,
				"language":idioma_esp,
				ajax: {
					"method":"GET",
					"url":"./SL_consumo",
					"data": {
				        "carga": 2//para decirle al servlet que cargue solo clinte + consumos
				    },
					"dataSrc":"aaData"
				},
				"columns": [
		            { "data": "nombreCompleto"},
		            { "data": "contratos[0].numContrato" },
		            { "data": "contratos[0].numMedidor" },
		            {"defaultContent":"<button type='button' style='margin-left:15px;' class='activar btn btn-primary'"
		            +"title='seleccionar cliente' id='seleccionarCl' >"
					+ "<i class='fa fa-upload'></i> </button>"}
		            ]
		    });
		 
		    // Aplicar la busqueda por columna
		    table.columns().every( function () {
		        var that = this;
		        $( 'input', this.header() ).on( 'keyup change', function () {
		            if ( that.search() !== this.value ) {
		                that.search( this.value) .draw();
		            }
		        } );
		    } );
		    cambiarCliente('#datatable-filter tbody', table);
	}
	
	function cambiarCliente(tbody, table) {
		$(tbody).on("click","button#seleccionarCl",function(){
			console.log("cambiar cliente");
			var datos = table.row($(this).parents("tr")).data();
			console.log(datos);
			$("#nombreClienteCompleto").val(datos.nombreCompleto);
			$("#numContrato").val(datos.contratos[0].numContrato);
			$("#numMedidor").val(datos.contratos[0].numMedidor);
			$("#cliente_ID").val(datos.cliente_ID);
			$("#contrato_ID").val(datos.contratos[0].contrato_ID);
			
			CloseModalBox();
		});
	}
	
	var seleccionarEditarConsumo = function(tbody, table) {
		$(tbody).on("click", "button.editarConsumo", function() {
			var datos = table.row($(this).parents("tr")).data();
			var f = new Date(datos.fecha_fin);
			var fecha = f.getDate()+"/"+(f.getMonth()+1)+"/"+f.getFullYear();
			$("#lectura_Actual").val(datos.lectura_Actual);
			$("#fecha_fin").val(fecha);
			$("#consumoTotal").val(datos.consumoTotal);
			$("#nombreClienteCompleto").val(datos.cliente.nombreCompleto);
			$("#numContrato").val(datos.contrato.numContrato);
			$("#numMedidor").val(datos.contrato.numMedidor);
			$("#opcion").val("actualizar");
			$("#consumo_ID").val(datos.consumo_ID);
			$("#cliente_ID").val(datos.cliente.cliente_ID);
			$("#contrato_ID").val(datos.contrato.contrato_ID);
			
			validarExpand(expand1, "#expandir1");
			if(colap1.valor==false)
				validarColap(colap1, "#colapsar_desplegar1");
			validarColap(colap2, "#colapsar_desplegar2");
			if(expand2.valor == true)
				validarExpand(expand2, "#expandir2");
		});
	}
	
	function iniciarTabla(){
		validarColap(colap1, "#colapsar_desplegar1");
		var tablaConsumo = $('#tabla_consumo').DataTable( {
			responsive: true,
			"destroy": true,
			'bProcessing': false,
			'bServerSide': false,
			ajax: {
				"method":"GET",
				"url":"./SL_consumo",
				"data": {
			        "carga": 1//para decirle al servlet que cargue consumos + cliente + contrato
			    },
				"dataSrc":"aaData"
			},
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todo"]],
        	"bJQueryUI": true,
			"language":idioma_esp,
			drawCallback: function(settings){
	            var api = this.api();
	            $('td', api.table().container()).find("button").tooltip({container : 'body'});
	            $("a.btn").tooltip({container: 'body'});
	        },
			"columns": [
	            { "data": null,
	                render: function ( data, type, row ) {
	                	var f = new Date(data.fecha_fin);
	        			var fecha = f.getDate()+"/"+(f.getMonth()+1)+"/"+f.getFullYear();
	                	return fecha;
	                }},
	            { "data": "lectura_Actual" },
	            { "data": "consumoTotal" },
	            { "data": "cliente.nombreCompleto" },
	            { "data": "contrato.numContrato" },
	            { "data": "contrato.numMedidor" },
	            {"defaultContent":"<button type='button' class='editarConsumo btn btn-primary' title='editar consumo'>"+
					"<i class='fa fa-pencil-square-o'></i> </button>  "+
					"<button type='button' class='eliminarConsumo btn btn-danger' title='eliminar consumo'>"+
					"<i class='fa fa-trash-o'></i> </button>"}
	            ],
	            "dom":"<rt><'row'<'form-inline' <'col-sm-12 text-center'B>>>"
					 +"<'row' <'form-inline' <'col-sm-6'l><'col-sm-6'f>>>"
					 +"<rt>"
					 +"<'row'<'form-inline'"
					 +"<'col-sm-6 col-md-6 col-lg-6'i><'col-sm-6 col-md-6 col-lg-6'p>>>",
	            "buttons":[{
					"text": "<i class='fa fa-plus-square'></i>",
					"titleAttr": "Agregar usuario",
					"className": "btn btn-success",
					"action": function() {
						agregar_nuevo_consumo();
					}
				},
				{
	                extend:    'excelHtml5',
	                text:      '<i class="fa fa-file-excel-o"></i>',
	                titleAttr: 'excel'
	            },
	            {
	                extend:    'csvHtml5',
	                text:      '<i class="fa fa-file-text-o"></i>',
	                titleAttr: 'csv'
	            },
	            {
	                extend:    'pdfHtml5',
	                text:      '<i class="fa fa-file-pdf-o"></i>',
	                titleAttr: 'pdf'
	            }]
		});
		seleccionarEditarConsumo('#tabla_consumo tbody', tablaConsumo);
		seleccionarEliminarConsumo('#tabla_consumo tbody', tablaConsumo);
	}
	
	var agregar_nuevo_consumo = function() {
		limpiar_texto();
		validarExpand(expand1, "#expandir1");
		if(colap1.valor==false)
			validarColap(colap1, "#colapsar_desplegar1");
		
		validarColap(colap2, "#colapsar_desplegar2");
		if(expand2.valor == true)
			validarExpand(expand2, "#expandir2");
		
		$("button#abrir_modal").focus();
	}
	
	var cancelar = function() {
		limpiar_texto();
		if(expand1.valor == true)
			validarExpand(expand1, "#expandir1");
		
		if(expand2.valor == true)
			validarExpand(expand2, "#expandir2");
		
		validarColap(colap1, "#colapsar_desplegar1");
		if (colap2.valor ==true){}else{
			validarColap(colap2, "#colapsar_desplegar2");
		}
	}
	
	var limpiar_texto = function() {//limpiar texto del formulario
		$("#opcion").val("guardar");
		$("#consumo_ID").val("");
		$("#cliente_ID").val("");
		$("#contrato_ID").val("");
		$("#lectura_Actual").val("");
		$("#fecha_fin").val("");
		$("#consumoTotal").val("");
		$("#nombreClienteCompleto").val("");
		$("#numContrato").val("");
		$("#numMedidor").val("");
	}
	
	var seleccionarEliminarConsumo = function(tbody, table) {
		$(tbody).on("click", "button.eliminarConsumo", function() {
			var datos = table.row($(this).parents("tr")).data();
			$("form#frmEliminarConsumo #consumo_id").val(datos.consumo_ID);
			abrirDialogo(eliminarConsumo);
		});
	}
	var eliminarConsumo = function() {
		$("#eliminar_consumo").on("click", function() {
			var consumo_id= $("#frmEliminarConsumo #consumo_id").val();//se obtiene el id del usuario que esta oculto
			var opcion = $("#frmEliminarConsumo #opcion").val();//se obtiene la opcion que esta oculta
			console.log("consumo_ID: " + consumo_id + ", opcion: " + opcion);
// 			$.ajax({
// 				method:"DELETE",
// 				url:"./SL_consumo",
// 				data: {"consumo_ID":usuario_id, "opcion": opcion}//se envian los datos al servlet
// 			}).done(function(info) {
// // 				verResultado(info);
// 					CloseModalBox();
// 			});
		});
	}
	$(document).ready(function() {

		//cargar scripts dataTables
		LoadDataTablesScripts2(AllTables);
		
		// Crear UI spinner
		$("#numContrato").spinner();

		// Inicializar DatePicker
		$('#fecha_fin').datepicker({
			setDate : new Date(),
			dateFormat: 'dd/mm/yy',
			onSelect: function(dateText, inst) {
				$("#fecha_fin").val(dateText.toString());
				$("#fecha_fin").change();
				$('form#defaultForm').bootstrapValidator('revalidateField', 'fecha');
			}
		});
		
	
		// Añadir Tooltip para formularios
		$('.form-control').tooltip();

		//Cargar ejemplo para validaciones
		LoadBootstrapValidatorScript(FormValidConsumo);

		//MODALS
		$('#abrir_modal').on('click',function(e) {
			OpenModalBox(
			"<div><h3>Buscar Cliente</h3></div>",
			"<div class='table-responsive'>"
			+ "<table class='table table-bordered table-striped table-hover table-heading table-datatable'"+
			"id='datatable-filter'>"
			+ "<thead>"
			+ "<tr>"
			+ "<th><label><input type='text' name='Nombres'/></label></th>"
			+ "<th><label><input type='text' name='Num_Contrato'/></label></th>"
			+ "<th><label><input type='text' name='Medidor'/></label></th>"
			+ "<th></th>"
			+ "</tr>"														
			+ "</thead>"														
			+ "<tfoot>"														
			+ "<tr><th Style='color: #5d96c3;'>Nombre Completo</th>"+
			"<th Style='color: #5d96c3;'>Numero Contrato</th>"+
			"<th Style='color: #5d96c3;'>Medidor</th><th></th></tr>"														
			+ "</tfoot>"														
			+ "</table>"														
			+ "</div>",
			"<div Style='text-align: center; margin-bottom: -5px;'><button type='button' class='btn-default btn-label-left btn-lg' "
			+"onclick='CloseModalBox()'><span><i class='fa fa-reply txt-danger'></i></span>Cancelar</button></div>");
			filtrarTabla();		
		});
		
		guardarConsumo();
		
		// Add Drag-n-Drop feature				
		WinMove();	
		
		//add tooltip
		$('[data-toggle="tooltip"]').tooltip();
	});
	
	function FormValidConsumo() {
		$('form#defaultForm').bootstrapValidator({
			message: 'Este valor no es valido',
			fields: {
				lectura:{
					validators: {
						notEmpty:{
			                message: "Este campo es requerido y no debe estar vacio"
			            },
			            greaterThan: {
	                        value: 0,
	                        inclusive: false,
	                        message: 'el valor debe ser mayor o igual a 0'
	                    },
						callback: {
           					message: 'la lectura actual debe ser mayor que la lectura de los registros anteriores',
            				callback: function (value, validator, $field) {
            					if($("form#defaultForm #contrato_ID").val()=="" && $("form#defaultForm #cliente_ID").val()==""){
            						return {
                                        valid: false,
                                        message: 'seleccione un cliente antes de digitar la lectura'
                                    }
                                }
            					var tabla = $('#tabla_consumo').DataTable();
                				var filas = tabla.rows();
                				var noigual = true;
                    			filas.every(function(index, loop, rowloop) {
            						if(value < tabla.row(index).data().lectura_Actual && 
            								$("form#defaultForm #contrato_ID").val() == tabla.row(index).data().contrato.contrato_ID){
            							noigual = false;
            						}
                    			});
                    			return noigual;
            				}
        				}
			        }
				},
				fecha:{
					validators: {
						notEmpty:{
			                message: "Este campo es requerido y no debe estar vacio"
			            },
			            callback: {
           					message: 'la fecha debe ser mayor que los anteriores registros de este cliente',
            				callback: function (value, validator, $field) {
            					var tabla = $('#tabla_consumo').DataTable();
                				var filas = tabla.rows();
                				var noigual = true;
                				var f = $("form#defaultForm #fecha_fin").val().split("/");
                				var fecha1 = new Date(f[2], f[1]-1, f[0]);
                    			filas.every(function(index, loop, rowloop) {
                    				var fecha2 = new Date(tabla.row(index).data().fecha_fin);
            						if(fecha1 <  fecha2 && $("form#defaultForm #contrato_ID").val() == 
            						tabla.row(index).data().contrato.contrato_ID){
            							noigual = false;
            						}
                    			});
                    			return noigual;
            				}
        				}
			        }
				},
				consumoActual:{
					validators: {
						notEmpty:{
			                message: "Este campo es requerido y no debe estar vacio"
			            }
			        }
				},
				numMedidor:{
					validators: {
						notEmpty:{
			                message: "Este campo es requerido y no debe estar vacio"
			            },
			            callback: {
           					message: 'seleccione un cliente',
           					callback: function (value, validator, $field) {
    			            	var noigual = true;
        						if($("form#defaultForm #contrato_ID").val() == ""){
        							noigual = false;
        						}
                				return noigual;
        					}
        				}
			        }
				},
			}
		});
	}
	
</script>
<!-- <div class="container"> -->
<!-- 	<div class="table-responsive"> -->
<!-- 		<table class="table" id="tablaNormal"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>Fecha_Corte</th> -->
<!-- 					<th>Lectura</th> -->
<!-- 					<th>Consumo</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr class="active"> -->
<!-- 					<td>1</td> -->
<!-- 					<td>Anna</td> -->
<!-- 					<td>3939.3</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>2</td> -->
<!-- 					<td>Debbie</td> -->
<!-- 					<td>32.34</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>3</td> -->
<!-- 					<td>como noo se</td> -->
<!-- 					<td>2324.1</td> -->
<!-- 				</tr> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-- </div> -->