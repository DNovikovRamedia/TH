using System;
using System.Collections.Generic;
using System.Text;
using Ideal.Wision;
using System.Text.RegularExpressions;

namespace Ktk.Model
{
    public class Variables
    {
        static Guid guidBannerLink1 = new Guid("39EEDE01-8D63-4e29-B1EF-2F0E0C992FD2");
        static string bannerLink1 = String.Empty;
        public static string BannerLink1
        {
            get
            {
                if (bannerLink1 == String.Empty)
                {
                    Ideal.Wision.Settings.Store.RetrieveString(guidBannerLink1, Guid.Empty, ref bannerLink1);
                }
                return bannerLink1;
            }
            set
            {
                bannerLink1 = value;
                Ideal.Wision.Settings.Store.StoreString(guidBannerLink1, Guid.Empty, bannerLink1);
            }
        }

        static Guid guidBannerLink2 = new Guid("39EEDE01-8D63-4e29-B1EF-2F0E0C992FD5");
        static string bannerLink2 = String.Empty;
        public static string BannerLink2
        {
            get
            {
                if (bannerLink2 == String.Empty)
                {
                    Ideal.Wision.Settings.Store.RetrieveString(guidBannerLink2, Guid.Empty, ref bannerLink2);
                }
                return bannerLink2;
            }
            set
            {
                bannerLink2 = value;
                Ideal.Wision.Settings.Store.StoreString(guidBannerLink2, Guid.Empty, bannerLink2);
            }
        }

        static Guid guidOrderEmail = new Guid("{39EEDE01-8D63-4e29-B1EF-2F0E0C792FD2}");
        static string orderEmail = String.Empty;
        public static string OrderEmail
        {
            get
            {
                if (orderEmail == String.Empty)
                {
                    Ideal.Wision.Settings.Store.RetrieveString(guidOrderEmail, Guid.Empty, ref orderEmail);
                }
                return orderEmail;
            }
            set
            {
                orderEmail = value;
                Ideal.Wision.Settings.Store.StoreString(guidOrderEmail, Guid.Empty, orderEmail);
            }
        }

        public static List<string> OrderEmails
        {
            get
            {
                List<string> ls = new List<string>();
                foreach (string s in OrderEmail.Split(','))
                {
                    if (s.Trim().Length > 5)
                    {
                        ls.Add(s.Trim());
                    }
                }
                return ls;
            }
        }
    }
}