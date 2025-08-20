<h1>Alumni Website</h1>
<p>The Alumni Website is a web-based platform designed to connect alumni, current students, and faculty members. It serves as a digital hub where former students can stay engaged with their alma mater, share experiences, and contribute to the growth of the institution community.</p>
<p>web application developed using .net and MySQL.</p>

<h2>Features </h2>

<h4>User features </h4>
  <p>1.Register on website<br>
    2.Login<br> 
    3.Search Member<br>
    4.Register for event<br> 
    5.pay for event online(through bank, upi app)<br>
    6.Give feedback<br>
    7.can see Notes and projects of alumni <br>
    8. add notes and projects</p>

<h4>Admin</h4>
<p>1.Edit or Delete user<br>
  2. Add Event<br>
  3. update Event<br>
  4. send Email<br>
  
</p>

<h2>Procedure to execute the web application</h2>
Install visual studio 2022 and SQL server management studio.<br>
Extract source code in visual studio<br>

for database use the database.sql file <br>
first create the database alumni and then use the database.sql file 

<h2>Steps to run the project</h2>
<p>1. Download the source code </p>
<p>2. create the database</p>
3. In web.config file add the connection string

```web.config
<connectionStrings>
    <add name="constr" 
         connectionString="add connection string" 
         providerName="System.Data.SqlClient" />
</connectionStrings>
```
in place of add connection string add your connection string 
<p>4. in email.aspx.cs file add your email id and app password(16 digit string password provided by google)</p><br>
```email.aspx.cs

                try
                {
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("Enter_your_gmail_id");
                    mail.To.Add(toEmail);
                    mail.Subject = subject;
                    mail.Body = body;

                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.Credentials = new NetworkCredential("Enter_your_gmail_id", "Enter_app_password");
                    smtp.EnableSsl = true;

                    smtp.Send(mail);```
                    
<p>5. use the same email id and app password in RegisterEvent.aspx.cs file </p>
RegisterEvent.aspx.cs

            mail.From = new MailAddress("enter_your_gmail_is"); // Your sender email
            mail.To.Add(studentEmail);
            mail.Subject = "Event Registration Successful!";
            mail.Body = $"Dear {studentName},\n\n" +
                        $"Thank you for registering for the event: {eventTitle}.\n\n" +
                        $" Payment ID: {paymentId}\n" +
                        $" Amount Paid: ₹{amount}\n" +
                        $" Payment Time: {DateTime.Now.ToString("f")}\n\n" +
                        $"We look forward to seeing you at the event!\n\n" +
                        $"Best regards,\nAlumni Event Team";

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("enter_your_gmail_is", "enter_app_password"); // use App Password
            smtp.EnableSsl = true;```

<p>6. Login to razorpay and generate the key and use that key in RegisterEvent.aspx file  </p>

```
 var options = {
            "key": "Enter_your_key",// Replace with your Razorpay key <asp:Label ID="lblStudentName" runat="server"></asp:Label><br />
            "amount": 50000,
            "currency": "INR",
            "name": "Alumni Event",
            "description": "Event Registration Fee",
```

<p>7. after all changes you can run the project</p>


some images of websites are shown below 
<p align="center">
  <img src="img/Screenshot 2025-08-20 200254.png" alt="img1" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200307.png" alt="img2" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200325.png" alt="img3" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200336.png" alt="img4" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200353.png" alt="img5" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200407.png" alt="img6" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200421.png" alt="img7" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200450.png" alt="img8" width="400">
</p>
<p align="center">
  <img src="img/Screenshot 2025-08-20 200434.png" alt="img9" width="400">
</p>
