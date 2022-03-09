using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string from = Request.Form["email"].ToString();
            string name = Request.Form["name"].ToString();
            string subject = Request.Form["subject"].ToString();
            string text = Request.Form["message"].ToString();

           

            string resultado = sendMail(from, subject, text);

            Label1.Text = resultado;
            SweetBoxConfirm("Éxito", "Correo enviado", "success", "Default.aspx", this.Page, this.GetType());
            //Response.Redirect("Default.aspx");
        }

    }

    string sendMail(string from, string subject, string text)
    {
        SmtpClient client = new SmtpClient();

        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;//Socket Secure Layer "https"
        client.Host = "smtp.gmail.com";
        client.Port = 587;

        //Autrenticarse en SMTP
        NetworkCredential credentials = new NetworkCredential("luisjorgecarrilloq@gmail.com", "20033029Jcq$");
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        //Creamos el correo
        MailMessage oMail = new MailMessage();
        oMail.From = new MailAddress(from);
        oMail.To.Add(new MailAddress("luisjorgecarrilloq@gmail.com"));
        oMail.CC.Add(new MailAddress(from));
        oMail.Subject = subject;
        oMail.IsBodyHtml = true;
        oMail.Priority = MailPriority.Low;
        oMail.Body = "<div style='font-size:2rem;font-weight:bold;color:white;'>El usuario " + from + " te ha mandado el siguiente mensaje: </div><hr><br>" + "<div style='font-size:1rem;color:pink;'>" + text + "</div>";

        try
        {
            client.Send(oMail);
            return "Enviando el email, por favor espere...";
            
        }
        catch (Exception ex)
        {
            return "Error en el envío" + ex.Message;
        }

        
    }
    public static void SweetBoxConfirm(String ex, String sub, String type, string url, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>";
        s += "swal({title: '" + ex + "',text: '" + sub + "',type: '" + type + "',showCancelButton: false,confirmButtonColor: '#DD6B55', confirmButtonText: 'OK',closeOnConfirm: true},function(){document.location.href = '" + url + "';});</SCRIPT>";


        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}