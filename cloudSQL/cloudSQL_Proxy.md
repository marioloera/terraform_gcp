# Cloud SQL Proxy
## What the proxy provides
The Cloud SQL Proxy provides secure access to your Cloud SQL Second Generation instances without having to allowlist IP addresses or configure SSL.

Accessing your Cloud SQL instance using the Cloud SQL Proxy offers these advantages:

* **Secure connections:** The proxy automatically encrypts traffic to and from the database using TLS 1.2 with a 128-bit AES cipher; SSL certificates are used to verify client and server identities.
* **Easier connection management:** The proxy handles authentication with Cloud SQL, removing the need to provide static IP addresses.

* **Note**: You do not need to use the proxy or configure SSL to connect to Cloud SQL from App Engine standard or the flexible environment. These connections use a "built-in" proxy implementation automatically.

## How the Cloud SQL Proxy works
The Cloud SQL Proxy works by having a local client, called the proxy, running in the local environment. Your application communicates with the proxy with the standard protocol used by your database. The proxy uses a secure tunnel to communicate with its companion process running on the server.

The following diagram shows how the proxy connects to Cloud SQL:


## Proxy startup options
When you start the proxy, you provide it with the following sets of information:

* What Cloud SQL instances it should establish connections to
* Where it will listen for data coming from your application to be sent to Cloud SQL
* Where it will find the credentials it will use to authenticate your application to Cloud SQL
The proxy startup options you provide determine whether it will listen on a TCP port or on a Unix socket. If it is listening on a Unix socket, it creates the socket at the location you choose; usually, the /cloudsql/ directory. For TCP, the proxy listens on localhost by default.

## Installing the Cloud SQL Proxy
  1. Download the proxy:
 ```
 wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O  cloud_sql_proxy
 ````

  1. Make the proxy executable:
 ````
 chmod +x cloud_sql_proxy
 ````
 
## Test connection to the database
1. Start by running the Cloud SQL proxy for the Cloud SQL instance:
````
export GOOGLE_PROJECT=$(gcloud config get-value project)
MYSQL_DB_NAME=$(terraform output -json | jq -r '.instance_name.value')
MYSQL_CONN_NAME="${GOOGLE_PROJECT}:us-central1:${MYSQL_DB_NAME}"
./cloud_sql_proxy -instances=${MYSQL_CONN_NAME}=tcp:3306
````
1. Now you'll start another Cloud Shell tab. 

 You'll use this shell to connect to the Cloud SQL proxy.

 Navigate to sql-with-terraform directory:

1. Get the generated password for MYSQL:
````
echo MYSQL_PASSWORD=$(terraform output -json | jq -r '.generated_user_password.value')
````
1. Test the MySQL connection:
````
mysql -udefault -p --host 127.0.0.1 default
````
1. When prompted, enter the value of MYSQL_PASSWORD, found in the output above, and press Enter.

1. You should successfully log into the MYSQL command line. Exit from MYSQL by typing Ctrl + d.

1. If you go back to the first Cloud Shell tab you'll see logs for the connections made to the Cloud SQL Proxy.