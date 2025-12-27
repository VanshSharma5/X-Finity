<%@ page import="java.util.List" %>
	<%@ page import="com.xfinity.contactmanager.models.Contact" %>
		<!doctype html>
		<html lang="en">

		<head>
			<title>Login 01</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

			<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

			<link rel="stylesheet" href="/style.css">
			<style>
				.table-container {
					overflow-x: auto;
				}

				.table-zebra {
					width: 100%;
					border-collapse: collapse;
					font-family: sans-serif;
					font-size: 0.9rem;
					box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
				}

				.table-zebra caption {
					caption-side: Top;
					text-align: left;
					font-size: 2rem;
					color: #666;
					padding: 10px 0;
				}

				.table-zebra thead {
					background-color: #2c3e50;
					/* A dark blue-grey header */
					color: #ffffff;
				}

				.table-zebra th,
				.table-zebra td {
					padding: 12px 15px;
					text-align: left;
					border-bottom: 1px solid #dddddd;
				}

				.table-zebra tbody tr:nth-of-type(even) {
					background-color: #f3f3f3;
				}

				.table-zebra tbody tr:nth-of-type(odd) {
					background-color: #bcefd0ff;
				}

				.table-zebra tbody tr:last-of-type {
					border-bottom: 2px solid #2c3e50;
				}

				/* Optional: Add a hover effect for better user interaction */
				.table-zebra tbody tr:hover {
					background-color: #a5c8f6ff;
					cursor: pointer;
				}
			</style>
		</head>
		<body style="color:darkblue;background-color:lightblue;">
			<!-- Nav Bar -->
			<div style="background-color:darkblue;" class="navbar navbar-expand-md">
				<div class="container">
					<a class="navbar-brand" href="/">
						<strong>
							<h4 style="margin-left:-10px;color:white">Welcome, ${user.name}</h4>
						</strong>
					</a>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 23.25 214 37.04999923706055" data-asc="1.2"
						width="214" height="37.04999923706055">
						<defs />
						<g fill="#ffffff">
							<g transform="translate(0, 0)">
								<path
									d="M4.25 60.30Q2.10 60.30 1.05 58.55Q0 56.80 0 54.60Q0 53.30 0.33 52.02Q0.65 50.75 1.30 49.70Q1.85 49.80 2.33 49.85Q2.80 49.90 3.25 49.90Q6.50 49.90 8.88 48Q11.25 46.10 12.65 43.05Q11.80 40.55 10.80 38.17Q9.80 35.80 8.68 34.25Q7.55 32.70 6.20 32.70Q5.40 32.70 4.65 33.38Q3.90 34.05 3.75 35.35L3.10 35.25Q3.15 29.25 4.77 26.48Q6.40 23.70 8.85 23.70Q10.80 23.70 12.35 25.17Q13.90 26.65 15.13 28.92Q16.35 31.20 17.30 33.60Q18.25 36 19.00 37.85Q20.05 33.05 21.83 29.92Q23.60 26.80 25.70 25.25Q27.80 23.70 29.65 23.70Q31.60 23.70 32.50 25.13Q33.40 26.55 33.40 28.65Q33.40 30.20 32.93 31.97Q32.45 33.75 31.55 35.35Q30.20 34.70 28.75 34.70Q26.40 34.70 24.30 36.47Q22.20 38.25 20.65 41.65Q22.30 45.25 23.45 47.35Q24.60 49.45 25.35 50.42Q26.10 51.40 26.65 51.70Q27.20 52 27.65 52Q29.50 52 29.80 49.55L30.40 49.65Q30.40 54.70 28.75 57.50Q27.10 60.30 24.05 60.30Q22.10 60.30 20.48 58.98Q18.85 57.65 17.35 54.75Q15.85 51.85 14.10 47.15Q13.40 51.35 11.78 54.30Q10.15 57.25 8.15 58.77Q6.15 60.30 4.25 60.30ZM35.85 49.35Q35.55 48.70 35.43 48.08Q35.30 47.45 35.30 46.90Q35.30 44.95 36.65 43.67Q38.00 42.40 40.30 42.40Q42.50 42.40 44.68 42.58Q46.85 42.75 48.70 42.75Q50.10 42.75 51.23 42.58Q52.35 42.40 53.05 41.90Q53.95 43.55 53.95 45Q53.95 46.70 52.70 47.80Q51.45 48.90 48.80 48.90Q46.05 48.90 43.95 48.83Q41.85 48.75 40.20 48.75Q38.85 48.75 37.78 48.85Q36.70 48.95 35.85 49.35ZM62.80 60.20Q61 60.20 59.55 58.70Q58.10 57.20 58.10 53.75Q58.10 50.95 58.75 48.25Q59.40 45.55 60.23 42.77Q61.05 40 61.63 37.02Q62.20 34.05 62 30.75Q60.65 30.95 59.35 31.45Q58.05 31.95 56.80 32.90Q56.80 29.75 57.35 27.77Q57.90 25.80 59.50 24.90Q61.10 24 64.25 24Q65.95 24 68.05 24.25Q70.15 24.50 72.38 24.75Q74.60 25 76.60 25Q78.55 25 80.10 24.63Q81.65 24.25 82.50 23.25Q83.50 23.90 84.03 25.02Q84.55 26.15 84.55 27.45Q84.55 28.80 83.93 30.07Q83.30 31.35 82 32.17Q80.70 33 78.60 33Q76.40 33 73.80 32.30Q71.20 31.60 68.45 31.10Q68.70 32.20 68.83 33.30Q68.95 34.40 68.95 35.55Q68.95 36.80 68.85 38.02Q68.75 39.25 68.55 40.55Q69.60 40 71.10 39.55Q72.60 39.10 74.18 38.80Q75.75 38.50 77 38.50Q77.80 38.50 78.40 38.65Q78.90 39.70 78.90 41.20Q78.90 43.60 77.70 46.10L77.35 46.25Q75.50 45.25 73.08 44.70Q70.65 44.15 68 43.95Q67.50 46.80 67.05 49.75Q66.60 52.70 66.60 55.80Q66.60 56.45 66.63 57.15Q66.65 57.85 66.70 58.55Q65.05 60.20 62.80 60.20ZM88.15 60.25Q86.75 60.25 85.68 59.08Q84.60 57.90 84.60 54.70Q84.60 54.15 84.63 53.73Q84.65 53.30 84.65 53.10Q84.85 51.10 85.23 48.13Q85.60 45.15 86.10 41.88Q86.60 38.60 87.13 35.55Q87.65 32.50 88.10 30.22Q88.55 27.95 88.85 27.10Q89.40 25.60 90.83 24.73Q92.25 23.85 93.75 23.85Q95.05 23.85 96.13 24.60Q97.20 25.35 97.60 27.15Q97.30 28.15 96.65 30.67Q96.00 33.20 95.25 36.85Q94.50 40.50 93.83 44.90Q93.15 49.30 92.75 54.10Q92.70 54.95 92.60 56.08Q92.50 57.20 92.45 58.35Q91.85 59 90.65 59.63Q89.45 60.25 88.15 60.25ZM105.45 60.20Q103.60 60.20 102.08 58.70Q100.55 57.20 100.55 53.95Q100.55 50.70 101.18 47.67Q101.80 44.65 102.63 41.85Q103.45 39.05 104.08 36.52Q104.70 34 104.70 31.75Q103.95 31.45 103.30 31.45Q102.40 31.45 101.80 32Q101.20 32.55 100.85 33.50L100.35 33.35Q100.40 29.85 101.38 27.77Q102.35 25.70 103.90 24.80Q105.45 23.90 107.10 23.90Q109.60 23.90 111.58 25.52Q113.55 27.15 115.13 29.95Q116.70 32.75 117.88 36.27Q119.05 39.80 119.90 43.63Q120.75 47.45 121.25 51.15Q121.55 49.15 121.88 46.25Q122.20 43.35 122.45 40.15Q122.70 36.95 122.70 34.05Q122.70 31.95 122.55 30.22Q122.40 28.50 122.05 27.25L122.05 26.85Q123.35 25.40 124.68 24.65Q126.00 23.90 127.15 23.90Q128.85 23.90 129.98 25.38Q131.10 26.85 131.10 29.55Q131.10 31.55 130.55 34.42Q130 37.30 129.25 40.55Q128.50 43.80 127.93 46.92Q127.35 50.05 127.30 52.55Q127.30 53.25 127.40 54.05Q127.50 54.85 128.45 54.85Q128.50 55.05 128.50 55.15Q128.50 55.25 128.50 55.35Q128.45 57.25 126.95 58.73Q125.45 60.20 122.95 60.20Q121.00 60.20 119.65 59.20Q118.30 58.20 117.40 56.52Q116.50 54.85 115.88 52.73Q115.25 50.60 114.70 48.35Q113.70 44.45 112.63 40.92Q111.55 37.40 109.75 34.45Q109.85 36.45 109.60 38.83Q109.35 41.20 109.08 43.63Q108.80 46.05 108.80 48.30Q108.80 50.30 109.15 51.98Q109.50 53.65 110.40 54.95Q110.40 57.40 108.85 58.80Q107.30 60.20 105.45 60.20ZM138.65 60.25Q137.25 60.25 136.18 59.08Q135.10 57.90 135.10 54.70Q135.10 54.15 135.13 53.73Q135.15 53.30 135.15 53.10Q135.35 51.10 135.73 48.13Q136.10 45.15 136.60 41.88Q137.10 38.60 137.63 35.55Q138.15 32.50 138.60 30.22Q139.05 27.95 139.35 27.10Q139.90 25.60 141.33 24.73Q142.75 23.85 144.25 23.85Q145.55 23.85 146.63 24.60Q147.70 25.35 148.10 27.15Q147.80 28.15 147.15 30.67Q146.50 33.20 145.75 36.85Q145.00 40.50 144.33 44.90Q143.65 49.30 143.25 54.10Q143.20 54.95 143.10 56.08Q143.00 57.20 142.95 58.35Q142.35 59 141.15 59.63Q139.95 60.25 138.65 60.25ZM162.00 60.20Q160.45 60.20 159.28 59.40Q158.10 58.60 158.15 57Q158.25 54.20 158.58 50.80Q158.90 47.40 159.35 43.88Q159.80 40.35 160.28 37.10Q160.75 33.85 161.15 31.30Q160.25 31.20 159.40 31.15Q158.55 31.10 157.85 31.10Q155.75 31.10 154.08 31.50Q152.40 31.90 151.25 32.90Q151.25 29.75 151.78 27.77Q152.30 25.80 153.73 24.90Q155.15 24 157.90 24Q159.90 24 162.38 24.32Q164.85 24.65 167.40 25Q169.95 25.35 172.15 25.35Q173.95 25.35 175.38 25Q176.80 24.65 177.55 23.75Q178.65 24.10 179.25 25.27Q179.85 26.45 179.85 27.85Q179.85 29.10 179.30 30.27Q178.75 31.45 177.55 32.22Q176.35 33 174.30 33Q173.35 33 171.98 32.83Q170.60 32.65 169.05 32.45Q168.50 35.45 167.93 39.63Q167.35 43.80 166.98 48.60Q166.60 53.40 166.50 58.35Q165.60 59.30 164.38 59.75Q163.15 60.20 162.00 60.20ZM193.60 60.20Q192.20 60.20 191.05 59.70Q189.90 59.20 189.35 58.45Q190.15 55.80 190.58 52.70Q191.00 49.60 191.00 46.55Q191.00 42.75 190.30 39.42Q189.60 36.10 188.18 34.05Q186.75 32 184.50 32Q182.80 32 180.65 33.40L180.15 33.20Q180.40 28.90 182.30 26.45Q184.20 24 187.10 24Q189.20 24 190.93 25.20Q192.65 26.40 193.98 28.40Q195.30 30.40 196.28 32.90Q197.25 35.40 197.85 38Q198.95 32.85 200.70 29.72Q202.45 26.60 204.45 25.17Q206.45 23.75 208.30 23.75Q210.65 23.75 212.33 25.65Q214.00 27.55 214.00 30.55Q214.00 32.20 213.40 34.10Q211.95 33.30 210.30 33.30Q208.15 33.30 206.00 34.58Q203.85 35.85 202.08 38.17Q200.30 40.50 199.30 43.65Q199.45 46.25 199.45 48.15Q199.45 50.75 199.15 53.02Q198.85 55.30 198.05 58.35Q197.10 59.30 195.93 59.75Q194.75 60.20 193.60 60.20Z" />
							</g>
						</g>
					</svg>
					<button class="btn btn-outline-secondary border-0" type="submit" title="Search"
						data-bs-toggle="modal" data-bs-target="#searchModal">
						<div class="">
							<a href="/logout" class="btn btn-danger">Logout</a>
						</div>
					</button>
				</div>
			</div>

			<% List<Contact> contacts = (List<Contact>) request.getAttribute("contacts"); %>

						<div class="container">
							<% if(!contacts.isEmpty()) { %>
								<div style="margin-top:-10%" class="ftco-section table-container">
									<table class="table-zebra">
										<caption>Current Page No ${param.page}</caption>
										<thead>
											<tr>
												<th scope="col">Id</th>
												<th scope="col">Name</th>
												<th scope="col">Contact No</th>
												<th scope="col">Contact No Informataion</th>
												<th scope="col">Designation</th>
												<th scope="col">House No</th>
												<th scope="col">Colony</th>
												<th scope="col">City</th>
												<th scope="col">Sub District</th>
												<th scope="col">Pin Code</th>
												<th scope="col">State</th>
												<th scope="col">Dealer Type</th>
												<th scope="col">Dealer Visit</th>
												<th scope="col">Dealer Visit Date</th>
												<th scope="col">Company Visit</th>
												<th scope="col">Company Visit Date</th>
												<th scope="col">Existing Dealer</th>
												<th scope="col">Call Detail Count</th>
												<th scope="col">Discussion1</th>
												<th scope="col">Discussion2</th>
												<th scope="col">Discussion3</th>
												<th scope="col">Discussion4</th>
												<th scope="col">Discussion5</th>
												<th scope="col">Rate Issue</th>
												<th scope="col">Quality Issue</th>
												<th scope="col">Service Issue</th>
												<th scope="col">Existing Dealer Company</th>
											</tr>
										</thead>
										<tbody>
											<tr>
											</tr>
											<% for(Contact contact: contacts) { %>
												<tr onclick="window.location.href='/contact?id=<%= contact.getId() %>'">
													<td>
														<%=contact.getId()%>
													</td>
													<td>
														<%=contact.getName()%>
													</td>
													<td>
														<%=contact.getContactNo()%>
													</td>
													<td>
														<%=contact.getContactNoInformataion()%>
													</td>
													<td>
														<%=contact.getDesignation()%>
													</td>
													<td>
														<%=contact.getHouseNo()%>
													</td>
													<td>
														<%=contact.getColony()%>
													</td>
													<td>
														<%=contact.getCity()%>
													</td>
													<td>
														<%=contact.getSubDistrict()%>
													</td>
													<td>
														<%=contact.getPinCode()%>
													</td>
													<td>
														<%=contact.getState()%>
													</td>
													<td>
														<%=contact.getDealerType()%>
													</td>
													<td>
														<%=contact.getDealerVisit()%>
													</td>
													<td>
														<%=contact.getDealerVisitDate()%>
													</td>
													<td>
														<%=contact.getCompanyVisit()%>
													</td>
													<td>
														<%=contact.getCompanyVisitDate()%>
													</td>
													<td>
														<%=contact.getExistingDealer()%>
													</td>
													<td>
														<%=contact.getCallDetailCount()%>
													</td>
													<td>
														<%=contact.getDiscussion1()%>
													</td>
													<td>
														<%=contact.getDiscussion2()%>
													</td>
													<td>
														<%=contact.getDiscussion3()%>
													</td>
													<td>
														<%=contact.getDiscussion4()%>
													</td>
													<td>
														<%=contact.getDiscussion5()%>
													</td>
													<td>
														<%=contact.getRateIssue()%>
													</td>
													<td>
														<%=contact.getQualityIssue()%>
													</td>
													<td>
														<%=contact.getServiceIssue()%>
													</td>
													<td>
														<%=contact.getExistingDealerCompany()%>
													</td>
													<% } %>
										</tbody>
									</table>
								</div>

								<% } else { %><center>
    <div class="container">
        <img width="50%" height="50%"  src="/error-t/assets/images/unexpected.png" />
        <br />
        <h2>Please Don't Panic It's Just a minor Problem
            <br/>
			It Might Seen There Is No available Data TO Display.
            </h2>
        <br />
    </div>
								</center>
							<% } %>
						</div>
						<!-- </div> -->
	<form  class="container" method="get" action="/contact/display">
		<div class="login-wrap p-5 p-md-10" style="color:darkblue;background-color:aliceblue;height:50px" >
			<div style="display:flex">
				<% if(Integer.parseInt(request.getParameter("page")) > 1){ %>
					<button type="submit" name="page" value="${param.page-1}" style="flex:1;margin:-10px; height:40px" class="btn btn-primary rounded submit px-3">Back</button>
				<% } %>
				<div style="flex:1"></div>				
				<% if(!contacts.isEmpty()) { %>
					<button type="submit" name="page" value="${param.page+1}" style="flex:1;margin:-10px" class="btn btn-primary rounded submit px-3">Next</button>
				<% } %>
			</div>
		</div>	
	</form>
		</body>

		</html>