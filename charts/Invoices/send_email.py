import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import sys

# Email sender and receiver details
sender_email = "samruddhishinde960@gmail.com"
receiver_email = "chulliyanshreyas@gmail.com"
password = "beuy dixd jxxp norn"  # Use an app password if 2FA is enabled

# Get the image path from command-line argument
image_path = sys.argv[1] if len(sys.argv) > 1 else 'chart_image.png'

# Create message container
msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = "Pharmacy Sales Chart"

# Email body
body = "Hello, here is the pharmacy sales chart!"
msg.attach(MIMEText(body, 'plain'))

# Attach the image
with open(image_path, "rb") as attachment:
    part = MIMEBase('application', 'octet-stream')
    part.set_payload(attachment.read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', 'attachment; filename="chart.png"')
    msg.attach(part)

# Gmail SMTP server setup
smtp_server = "smtp.gmail.com"
smtp_port = 587

try:
    # Connect to Gmail SMTP server
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Start TLS encryption
    server.login(sender_email, password)  # Login to your email account

    # Send email
    text = msg.as_string()
    server.sendmail(sender_email, receiver_email, text)

    print("Email sent successfully!")

except Exception as e:
    print(f"Error: {e}")

finally:
    server.quit()  # Close the connection