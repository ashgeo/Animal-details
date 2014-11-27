using System;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Data;

namespace Assignment
{
    public static class RetrieveData
    {
        public static string Get(string url)
        {
            // Create a request for the URL. 
            WebRequest request = WebRequest.Create(url);
            // If required by the server, set the credentials.
            request.Credentials = CredentialCache.DefaultCredentials;
            // Get the response.
            WebResponse response = request.GetResponse();
            // Display the status.
            Console.WriteLine(((HttpWebResponse)response).StatusDescription);
            // Get the stream containing content returned by the server.
            Stream dataStream = response.GetResponseStream();
            // Open the stream using a StreamReader for easy access.
            StreamReader reader = new StreamReader(dataStream);
            // Read the content.
            string responseFromServer = reader.ReadToEnd();
            // Display the content.

            // Clean up the streams and the response.
            reader.Close();
            response.Close();

            return responseFromServer;
        }

        public static DataTable DerializeDataTable(string data)
        {
            string json = data; //"data" should contain your JSON 
            var table = JsonConvert.DeserializeObject<DataTable>(json);
            return table;
        }
    }
}