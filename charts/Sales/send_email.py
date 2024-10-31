import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import sys
import logging

# Set up logging
logging.basicConfig(filename='python_email_log.txt', level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Email sender and receiver details
sender_email = "samruddhishinde960@gmail.com"
receiver_email = "chulliyanshreyas@gmail.com"
password = "beuy dixd jxxp norn"  # Use an app password if 2FA is enabled

# Get the image path from command-line argument
image_path = sys.argv[1] if len(sys.argv) > 1 else 'customer_chart.png'

logging.info(f"Starting email process with image: {image_path}")

# Create message container
msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = "Top Customers by Total Price Chart"

# Email body
body = "Hello, here is the Top Customers by Total Price chart from your pharmacy management system!"
msg.attach(MIMEText(body, 'plain'))

# Attach the image
try:
    with open(image_path, "rb") as attachment:
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', f'attachment; filename="{image_path}"')
        msg.attach(part)
    logging.info("Image attached successfully")
except Exception as e:
    logging.error(f"Error attaching image: {str(e)}")
    print(f"Error: {str(e)}")
    sys.exit(1)

# Gmail SMTP server setup
smtp_server = "smtp.gmail.com"
smtp_port = 587

try:
    # Connect to Gmail SMTP server
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Start TLS encryption
    logging.info("Connected to SMTP server")

    # Login to your email account
    server.login(sender_email, password)
    logging.info("Logged in to email account")

    # Send email
    text = msg.as_string()
    server.sendmail(sender_email, receiver_email, text)
    logging.info("Email sent successfully")
    print("Email sent successfully!")

except Exception as e:
    logging.error(f"Error sending email: {str(e)}")
    print(f"Error: {str(e)}")

finally:
    try:
        server.quit()  # Close the connection
        logging.info("SMTP connection closed")
    except:
        pass