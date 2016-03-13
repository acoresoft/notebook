$(function(){
	//触发全屏
	/*$(document).on("click","[data-toggle=fullscreen]",function(e){
		if(screenfull.enabled){screenfull.request()}
	});*/
	/*$("input[placeholder], textarea[placeholder]").placeholder();*/
	$("[data-toggle=popover]").popover();
	$(document).on("click",".popover-title .close",function(e){
		var $target=$(e.target),$popover=$target.closest(".popover").prev();
		$popover&&$popover.popover("hide");
	});
	$(document).on("click",'[data-toggle="ajaxModal"]',function(e){
		$("#ajaxModal").remove();e.preventDefault();
		var $this=$(this),$remote=$this.data("remote")||$this.attr("href"),
		$modal=$('<div class="modal" id="ajaxModal"><div class="modal-body"></div></div>');
		$("body").append($modal);
		$modal.modal();
		$modal.load($remote)
	});
	$.fn.dropdown.Constructor.prototype.change=function(e){
		e.preventDefault();
		var $item=$(e.target),$select,$checked=false,
		$menu,$label;!$item.is("a")&&($item=$item.closest("a"));
		$menu=$item.closest(".dropdown-menu");
		$label=$menu.parent().find(".dropdown-label");
		$labelHolder=$label.text();
		$select=$item.find("input");
		$checked=$select.is(":checked");
		if($select.is(":disabled")){
			return
		}
		if($select.attr("type")=="radio"&&$checked){return}
		if($select.attr("type")=="radio"){
			$menu.find("li").removeClass("active")
		}
		$item.parent().removeClass("active");
		!$checked&&$item.parent().addClass("active");
		$select.prop("checked",!$select.prop("checked"));
		$items=$menu.find("li > a > input:checked");
		if($items.length){
			$text=[];
			$items.each(function(){
				var $str=$(this).parent().text();
				$str&&$text.push($.trim($str))});
				$text=$text.length<4?$text.join(", "):$text.length+" selected";
				$label.html($text)
		}else{
			$label.html($label.data("placeholder"))}
	};
	$(document).on("click.dropdown-menu",".dropdown-select > li > a",$.fn.dropdown.Constructor.prototype.change);
	$("[data-toggle=tooltip]").tooltip();
	$(document).on("click",'[data-toggle^="class"]',function(e){
		e&&e.preventDefault();
		var $this=$(e.target),$class,$target,$tmp,$classes,$targets;
		!$this.data("toggle")&&($this=$this.closest('[data-toggle^="class"]'));
		$class=$this.data()["toggle"];
		$target=$this.data("target")||$this.attr("href");
		$class&&($tmp=$class.split(":")[1])&&($classes=$tmp.split(","));
		$target&&($targets=$target.split(","));
		$targets&&$targets.length&&$.each($targets,function(index,value){(
				$targets[index]!="#")&&$($targets[index]).toggleClass($classes[index])
		});
		$this.toggleClass("active")
	});
	$(document).on("click",".panel-toggle",function(e){
		e&&e.preventDefault();
		var $this=$(e.target),$class="collapse",$target;
		if(!$this.is("a")){
			$this=$this.closest("a")
			}
		$target=$this.closest(".panel");$target.find(".panel-body").toggleClass($class);
		$this.toggleClass("active")
	});
	$(".carousel.auto").carousel();
	$(document).on("click.button.data-api","[data-loading-text]",function(e){
		var $this=$(e.target);$this.is("i")&&($this=$this.parent());
		$this.button("loading")
	});
	var $window=$(window);
	var mobile=function(option){
		if(option=="reset"){
			//$('[data-toggle^="shift"]').shift("reset");
			return true
		}
		//$('[data-toggle^="shift"]').shift("init");
		return true;
	};
	$window.width()<768&&mobile();
	var $resize,$width=$window.width();
	$window.resize(function(){
		setHeight();
		if($width!==$window.width()){
			clearTimeout($resize);
			$resize=setTimeout(function(){
				setHeight();
				$window.width()<767&&mobile();
				$window.width()>=768&&mobile("reset")&&fixVbox();
				$width=$window.width()},500)}
		});
	var setHeight=function(){
		//$(".app-fluid #nav > *").css("min-height",$(window).height()-50);
		$("#nav .scrollable").height($(window).height()-90);
		return true;
	};
	setHeight();
	var fixVbox=function(){
		$(".ie11 .vbox").each(function(){
			$(this).height($(this).parent().height())
		})
	};
	fixVbox();
			
	$(document).on("click",".nav-primary a",function(e){
		var $this=$(e.target),$active;
		$this.is("a")||($this=$this.closest("a"));
		if($(".nav-vertical").length){return}
		$active=$this.parent().siblings(".active");
		$active&&$active.find("> a").toggleClass("active")&&$active.toggleClass("active").find("> ul:visible").slideUp(200);
		($this.hasClass("active")&&$this.next().slideUp(200))||$this.next().slideDown(200);
		$this.toggleClass("active").parent().toggleClass("active");
		$this.next().is("ul")&&e.preventDefault();
		setTimeout(function(){
			$(document).trigger("updateNav")},300)
		});
	$(document).on("click.bs.dropdown.data-api",".dropdown .on, .dropup .on",function(e){
		e.stopPropagation()
	});
	/**
	 * AJAX加载
	 */
	$("[nav-n]").each(function () {
		$(this).bind("click",function(){
				var nav = $(this).attr("nav-n");
				var sn = nav.split(",");
				var html = '<li><i class="fa fa-home"></i>';
				html+='<a href="index">Home</a></li>';
				for(var i=0;i<2;i++){
					html+='<li><a href="javascript:void(0)">'+sn[i]+'</a></li>';
				}
				$("#topli").html(html);
				var tb = $("#loadhtml");
				//tb.html(CommnUtil.loadingImg());
				//tb.load($$ctx+sn[2]);
		});
		
		// sparkline
		var sr, sparkline = function($re){
			$(".sparkline").each(function(){
				var $data = $(this).data();
				if($re && !$data.resize) return;
				($data.type == 'pie') && $data.sliceColors && ($data.sliceColors = eval($data.sliceColors));
				($data.type == 'bar') && $data.stackedBarColor && ($data.stackedBarColor = eval($data.stackedBarColor));
				$data.valueSpots = {'0:': $data.spotColor};
				$(this).sparkline('html', $data);
			});
		};
		$(window).resize(function(e) {
			clearTimeout(sr);
			sr = setTimeout(function(){sparkline(true)}, 500);
		});
		sparkline(false);


		// easypie
	    $('.easypiechart').each(function(){
	    	var $this = $(this), 
	    	$data = $this.data(), 
	    	$step = $this.find('.step'), 
	    	$target_value = parseInt($($data.target).text()),
	    	$value = 0;
	    	$data.barColor || ( $data.barColor = function($percent) {
	            $percent /= 100;
	            return "rgb(" + Math.round(200 * $percent) + ", 200, " + Math.round(200 * (1 - $percent)) + ")";
	        });
	    	$data.onStep =  function(value){
	    		$value = value;
	    		$step.text(parseInt(value));
	    		$data.target && $($data.target).text(parseInt(value) + $target_value);
	    	}
	    	$data.onStop =  function(){
	    		$target_value = parseInt($($data.target).text());
	    		$data.update && setTimeout(function() {
			        $this.data('easyPieChart').update(100 - $value);
			    }, $data.update);
	    	}
			$(this).easyPieChart($data);
		});

	  	// combodate
		$(".combodate").each(function(){ 
			$(this).combodate();
			$(this).next('.combodate').find('select').addClass('form-control');
		});

		// datepicker
		$(".datepicker-input").each(function(){ $(this).datepicker();});

		// dropfile
		$('.dropfile').each(function(){
			var $dropbox = $(this);
			if (typeof window.FileReader === 'undefined') {
			  $('small',this).html('File API & FileReader API not supported').addClass('text-danger');
			  return;
			}

			this.ondragover = function () {$dropbox.addClass('hover'); return false; };
			this.ondragend = function () {$dropbox.removeClass('hover'); return false; };
			this.ondrop = function (e) {
			  e.preventDefault();
			  $dropbox.removeClass('hover').html('');
			  var file = e.dataTransfer.files[0],
			      reader = new FileReader();
			  reader.onload = function (event) {
			  	$dropbox.append($('<img>').attr('src', event.target.result));
			  };
			  reader.readAsDataURL(file);
			  return false;
			};
		});

		// fuelux pillbox
		var addPill = function($input){
			var $text = $input.val(), $pills = $input.closest('.pillbox'), $repeat = false, $repeatPill;
			if($text == "") return;
			$("li", $pills).text(function(i,v){
		        if(v == $text){
		        	$repeatPill = $(this);
		        	$repeat = true;
		        }
		    });
		    if($repeat) {
		    	$repeatPill.fadeOut().fadeIn();
		    	return;
		    };
		    $item = $('<li class="label bg-dark">'+$text+'</li> ');
			$item.insertBefore($input);
			$input.val('');
			$pills.trigger('change', $item);
		};

		$('.pillbox input').on('blur', function() {
			addPill($(this));
		});

		$('.pillbox input').on('keypress', function(e) {
		    if(e.which == 13) {
		        e.preventDefault();
		        addPill($(this));
		    }
		});

		// slider
		$('.slider').each(function(){
			$(this).slider();
		});

		// wizard
	  $(document).on('change', '.wizard', function (e, data) {
	    if(data.direction !== 'next' ) return;
	    var item = $(this).wizard('selectedItem');
	    var $step = $(this).find('.step-pane:eq(' + (item.step-1) + ')');
	    var validated = true;
	    $('[data-required="true"]', $step).each(function(){
	      return (validated = $(this).parsley( 'validate' ));
	    });
	    if(!validated) return e.preventDefault();
	  });

		// sortable
		if ($.fn.sortable) {
		  $('.sortable').sortable();
		}

		// slim-scroll
		$('.no-touch .slim-scroll').each(function(){
			var $self = $(this), $data = $self.data(), $slimResize;
			$self.slimScroll($data);
			$(window).resize(function(e) {
				clearTimeout($slimResize);
				$slimResize = setTimeout(function(){$self.slimScroll($data);}, 500);
			});

	    $(document).on('updateNav', function(){
	      $self.slimScroll($data);
	    });
		});

		// pjax
		if ($.support.pjax) {
		  $(document).on('click', 'a[data-pjax]', function(event) {
		  	event.preventDefault();
		    var container = $($(this).data('target'));
		    $.pjax.click(event, {container: container});
		  })
		};

		// portlet
		/*$('.portlet').each(function(){
			$(".portlet").sortable({
		        connectWith: '.portlet',
	            iframeFix: false,
	            items: '.portlet-item',
	            opacity: 0.8,
	            helper: 'original',
	            revert: true,
	            forceHelperSize: true,
	            placeholder: 'sortable-box-placeholder round-all',
	            forcePlaceholderSize: true,
	            tolerance: 'pointer'
		    });
	    });
	*/
		// docs
	    $('#docs pre code').each(function(){
		    var $this = $(this);
		    var t = $this.html();
		    $this.html(t.replace(/</g, '&lt;').replace(/>/g, '&gt;'));
		});

		// fontawesome
		$(document).on('click', '.fontawesome-icon-list a', function(e){
			e && e.preventDefault();
		});

		// table select/deselect all
		$(document).on('change', 'table thead [type="checkbox"]', function(e){
			e && e.preventDefault();
			var $table = $(e.target).closest('table'), $checked = $(e.target).is(':checked');
			$('tbody [type="checkbox"]',$table).prop('checked', $checked);
		});

		// random progress
		$(document).on('click', '[data-toggle^="progress"]', function(e){
			e && e.preventDefault();

			$el = $(e.target);
			$target = $($el.data('target'));
			$('.progress', $target).each(
				function(){
					var $max = 50, $data, $ps = $('.progress-bar',this).last();
					($(this).hasClass('progress-xs') || $(this).hasClass('progress-sm')) && ($max = 100);
					$data = Math.floor(Math.random()*$max)+'%';
					$ps.css('width', $data).attr('data-original-title', $data);
				}
			);
		});
		
		// add notes
		function addMsg($msg){
			var $el = $('.nav-user'), $n = $('.count:first', $el), $v = parseInt($n.text());
			$('.count', $el).fadeOut().fadeIn().text($v+1);
			$($msg).hide().prependTo($el.find('.list-group')).slideDown().css('display','block');
		}
		var $msg = '<a href="#" class="media list-group-item">'+
	                  '<span class="pull-left thumb-sm text-center">'+
	                    '<i class="fa fa-envelope-o fa-2x text-success"></i>'+
	                  '</span>'+
	                  '<span class="media-body block m-b-none">'+
	                    'Sophi sent you a email<br>'+
	                    '<small class="text-muted">1 minutes ago</small>'+
	                  '</span>'+
	                '</a>';	
	  setTimeout(function(){addMsg($msg);}, 1500);

		// select2 
	 	if ($.fn.select2) {
	      $("#select2-option").select2();
	      $("#select2-tags").select2({
	        tags:["red", "green", "blue"],
	        tokenSeparators: [",", " "]}
	      );
	  	}

	});
})
