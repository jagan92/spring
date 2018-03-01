<%@ include file="/WEB-INF/views/include.jsp"%>
<label style="font-size: xx-large;">Consultant List</label>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Display Consultant</h3>
				</div>
			</div>
			<div class="box-body">
				<div class="col-md-12">
					<table class="table table-striped">
	                <tr>
	                  <th>#</th>
	                  <th>First Name</th>
	                  <th>Last Name</th>
	                  <th>Action</th>
	                  <th>Remove</th>
	                </tr>
	                <c:forEach items="${consultantVOs}" var="consultant"  >
                		<tr>
		                  <td>TWE ${consultant.id}</td>
		                  <td><c:out value="${consultant.first_name}"></c:out></td>
		                  <td>${consultant.last_name}</td>
		                  <td>
		                  	<a href="consultant.htm?consultantId=${consultant.id}">Edit</a>
		                  	
		                  </td>
		                  <td>
		                 <%--  <a href="consultant.htm?consultantId=${consultant.id}">Delete</a> --%>
		                  
		                  <a href="consultant-delete.htm?consultantId=${consultant.id}" onclick="return confirm('Are you sure?')">Delete </a>
		                  </td>
		                </tr>
	                </c:forEach>
	               </table>
				</div>      
			</div>
		</div>
	</div>
</section>