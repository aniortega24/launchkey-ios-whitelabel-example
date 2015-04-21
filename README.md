# LaunchKey iOS White Label Example App

  * [Overview](#overview)
  * [Pre-Requisites](#prerequisites)
  * [Quick Start](#quick-start)
  * [Support](#support)

# <a name="overview"></a>Overview

LaunchKey is an identity and access management platform  The iOS White Label SDK enables developers to quickly integrate
the LaunchKey platform directly in their existing iOS applications.

Developer documentation for using the LaunchKey API is found [here](https://launchkey.com/docs/).

An overview of the LaunchKey platform can be found [here](https://launchkey.com/platform).

#  <a name="prerequisites"></a>Pre-Requisites

Utilization of the LaunchKey WhiteLabel example requires the following items:

 * LaunchKey Account - The [LaunchKey Mobile App](https://launchkey.com/app) is required to set up a new account and
 access the LaunchKey Dashboard.
 
 * A WhiteLabel rocket - A new rocket can be created in the [LaunchKey Dashboard](https://dashboard.launchkey.com/).
   From the application, you will need the following found in the keys section of the application details:

    * The White Label sdk key
    
    __In order to use the White Label features currently hidden within Dashboard, you must contact your LaunchKey representative with the name of your Organization.__


#  <a name="quick-start"></a>Quick Start

  In the AppDelegate, initialize the LaunchKeySDKManager with your White Label sdk key

    [[LaunchKeySDKManager sharedClient] init:@"<WhiteLabel_key>"];
  
#  <a name="support"></a>Support

## Twitter

Submit a question to the Twitter Handle [@LaunchKeyHelp](https://twitter.com/LaunchKeyHelp).

## IRC

Engage the LaunchKey team in the `#launchkey` chat room on [freenode](https://freenode.net/).

## LaunchKey Help Desk

Browse FAQ's or submit a question to the LaunchKey support team for both
technical and non-technical issues. Visit the LaunchKey Help Desk [here](https://launchkey.desk.com/).