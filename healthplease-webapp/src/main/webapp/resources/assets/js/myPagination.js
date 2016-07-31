/**
 * 
 */
   var curIndex = 0;
   var size = 0; 
   
   function paginateTable(count,set)
   {
   	var table = $('.paginate');
   	var setCount = 0;
   	var counter = 0;
   	var pageNumbers = "";
   	var min = set - 4;
   	var max = set + 4;
   	pageNumbers = pageNumbers + "<li><a href='#' onclick='prev()'><<</a></li>";
   	table.find('tr').each(function(index, row)
   	{
   		if($(row).attr('class') == 'page_header') {
   			return;
   		}
   		if(index%count == 0 && index!=0) {
   			if(setCount >= min && setCount <= max) {
   				pageNumbers = pageNumbers + "<li><a href='#' onclick='gotoPage(" + setCount +")'>" + (setCount + 1) +"</a></li>";
   			}
   			setCount++;
   			counter = 0;
   		}
   		if(setCount == set && counter <= count) {
   			$(row).show();
   		} else {
   			$(row).hide();
   		}
   		counter++;
   	});
   	pageNumbers = pageNumbers + "<li><a href='#' onclick='gotoPage(" + setCount +")'>" + (setCount + 1) +"</a></li>";
   	pageNumbers = pageNumbers + "<li><a href='#' onclick='next()'>>></a></li>";
   	$(".pagination").html(pageNumbers);
   	curIndex = set;
   	size = count;
   }
   
   function next() {
	   paginateTable(size,curIndex + 1);
   }
   
   function prev() {
	   if(curIndex < 0) {
		   return;
	   }
	   paginateTable(size,curIndex - 1);
   }
   
   function gotoPage(pageNo) {
	   paginateTable(size, pageNo);
   }