---
title: AZ-104 — Restablecimiento de contraseñas con SSPR
aliases: ["Restablecimiento de contraseñas con SSPR (AZ-104)", "Permitir que los usuarios restablezcan sus contraseñas (AZ-104)"]
tags: [associate, identity]
certification: [AZ-104]
updated: 2026-08-26
sources:
  - https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/
---

# AZ-104 — Restablecimiento de contraseñas con SSPR

Módulo 08 del [AZ-104T00](https://learn.microsoft.com/en-us/training/courses/az-104t00) · Ruta 1 — Administración de identidades y gobernanza · Área: Administración de identidades y gobernanza en Azure (20–25%).

## Concepto

Evaluar el autoservicio de restablecimiento de contraseña (SSPR) para que los usuarios restablezcan contraseñas o desbloqueen cuentas; implementarlo, configurarlo y probarlo.

## Resumen en mis palabras

> *(pendiente — rellenar al estudiar el módulo)*

## Por qué importa para el examen

> - Configuración del autoservicio de restablecimiento de contraseña (SSPR)
> - Métodos de autenticación habilitados y combinación de métodos requerida

## Enlaces relacionados

**Módulo de Learn**: [Permitir que los usuarios restablezcan sus contraseñas con el autoservicio de restablecimiento de contraseña de Microsoft Entra](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/)

**Savill**: buscar "SSPR" / "password" en la [playlist AZ-104](https://www.youtube.com/playlist?list=PLlVtbbG169nGlGPWs9xaLKT1KfwqREHbs) · repaso final con el [Study Cram v2](https://www.youtube.com/watch?v=0Knf9nub4-k)

**Páginas de `knowledge/`**: [[Entra ID]]

**Laboratorio**: Lab 01 (Entra ID) de [MicrosoftLearning/AZ-104](https://github.com/MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator) — ver [labs/AZ-104](../labs/AZ-104/README.md)

## Relacionado

- [Índice AZ-104](../certifications/AZ-104/INDEX.md)
- [[Entra ID]]

# What is self-service password reset in Microsoft Entra ID?

You've been asked to assess ways to reduce help-desk costs in your retail organization. You've noticed that the support staff spends a lot of their time resetting passwords for users. Users often complain about delays with this process, and these delays impact their productivity. You want to understand how you can configure Azure to allow users to manage their own passwords.

In this unit, you'll learn how self-service password reset (SSPR) works in Microsoft Entra ID.

## Why use SSPR?

In Microsoft Entra ID, any user can change their password if they're already signed in. But if they're not signed in, forgot their password, or it's expired, they'll need to reset their password. With SSPR, users can reset their passwords in a web browser or from a Windows sign-in screen to regain access to Azure, Microsoft 365, and any other application that uses Microsoft Entra ID for authentication.

SSPR reduces the load on administrators because users can fix password problems themselves without having to call the help desk. Also, it minimizes the productivity impact of a forgotten or expired password. Users don't have to wait until an administrator is available to reset their password.

## How SSPR works

The user initiates a password reset either by going directly to the password-reset portal, or by selecting the **Can't access your account** link on a sign-in page. The reset portal takes these steps:

1. **Localization**: The portal checks the browser's locale setting and renders the SSPR page in the appropriate language.
2. **Verification**: The user enters their username and passes a CAPTCHA to ensure that it's a user and not a bot.
3. **Authentication**: The user enters the required data to authenticate their identity. They might enter a code or answer security questions.
4. **Password reset**: If the user passes the authentication tests, they can enter a new password and confirm it.
5. **Notification**: A message is sent to the user to confirm the reset.

There are several ways you can customize the SSPR user experience. For example, you can add your company logo to the sign-in page so users know they're in the right place to reset their password.

## Authenticate a password reset

It's critical to verify a user's identity before you allow a password reset. Malicious users might exploit any weakness in the system to impersonate that user. Azure supports six different ways to authenticate reset requests.

As an administrator, you can choose the methods to use when you configure SSPR. Enable two or more of these methods so that users can choose the ones they can easily use. The methods are:

| Authentication method   | How to register                                                                                                               | How to authenticate for a password reset                                                                                              |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Mobile app notification | Install the Microsoft Authenticator app on your mobile device, then register it on the multifactor authentication setup page. | Azure sends a notification to the app, which you can either verify or deny.                                                           |
| Mobile app code         | This method also uses the Authenticator app, and you install and register it in the same way.                                 | Enter the code from the app.                                                                                                          |
| Email                   | Provide an email address that's external to Azure and Microsoft 365.                                                          | Azure sends a code to the address, which you enter in the reset wizard.                                                               |
| Mobile phone            | Provide a mobile phone number.                                                                                                | Azure sends a code to the phone in an SMS message, which you enter in the reset wizard. You can also choose to get an automated call. |
| Office phone            | Provide a nonmobile phone number.                                                                                             | You receive an automated call to this number and press #.                                                                             |
| Security questions      | Select questions such as "In what city was your mother born?" and save their responses.                                       | Answer the questions.                                                                                                                 |

### Require the minimum number of authentication methods

You can specify the minimum number of methods that the user must set up, either one or two. For example, you might enable the mobile app code, email, office phone, and security questions methods and specify a minimum of two methods. Users can then choose the two methods they prefer, like mobile app code and email.

For the security-question method, you can specify a minimum number of questions the user must set up to register for this method. You also can specify a minimum number of questions they must answer correctly to reset their password.

After your users register the required information for the minimum number of methods you've specified, they're considered registered for SSPR.

### Recommendations

- Enable two or more of the authentication reset request methods.
- Use the mobile app notification or code as the primary method. But also enable the email or office phone methods to support users without mobile devices.
- The mobile phone method isn't a recommended method, because it's possible to send fraudulent SMS messages.
- The security-question option is the least recommended method, because the answers to the security questions might be known to other people. Only use the security-question method in combination with at least one other method.

### Accounts associated with administrator roles

- A strong, two-method authentication policy is always applied to accounts with an administrator role, regardless of your configuration for other users.
- The security-question method isn't available to accounts associated with an administrator role.

## Configure notifications

Administrators can choose how users are notified of password changes. There are two options you can enable:

- **Notify users on password resets**: The user who resets their own password is notified to their primary and secondary email addresses. If the reset was done by a malicious user, this notification alerts the user, who can take mitigation steps.
- **Notify all admins when other admins reset their password**: All administrators are notified when another administrator resets their password.

## License requirements

There are two editions of Microsoft Entra ID, Premium P1 and Premium P2. The password-reset functionality you can use depends on your edition.

Any user who is signed in can change their password, regardless of the edition of Microsoft Entra ID.

What if you're not signed in, and you've forgotten your password or your password has expired? In this case, you can use SSPR in Microsoft Entra ID P1 or P2. It's also available with Microsoft 365 Apps for business or Microsoft 365.

In a hybrid situation, where you have Active Directory on-premises and Microsoft Entra ID in the cloud, any password change in the cloud must be written back to the on-premises directory. This writeback support is available in Microsoft Entra ID P1 or P2. It's also available with Microsoft 365 Apps for business.

## SSPR deployment options

You can deploy SSPR with password writeback by using [Microsoft Entra Connect](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr-writeback/) or [cloud sync](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-cloud-sync-sspr-writeback/), depending on user needs. You can deploy each option side-by-side in different domains to target different sets of users. This helps existing users on-premises to write back password changes, while adding an option for users in disconnected domains because of a company merger or split. Users from an existing on-premises domain can use Microsoft Entra Connect, while new users from a merger can use cloud sync in another domain.

Cloud sync can also provide higher availability, because it doesn't rely on a single instance of Microsoft Entra Connect. For a feature comparison between the two deployment options, see [Comparison between Microsoft Entra Connect and cloud sync](https://learn.microsoft.com/en-us/entra/identity/hybrid/cloud-sync/what-is-cloud-sync#how-is-azure-ad-connect-cloud-sync-different-from-azure-ad-connect-sync/).


# Implement Microsoft Entra self-service password reset

You've decided to implement self-service password reset (SSPR) in Microsoft Entra ID for your organization. You want to start using SSPR for a group of 20 users in the marketing department as a trial deployment. If everything works well, you'll enable SSPR for your whole organization.

In this unit, you'll learn how to enable SSPR in Microsoft Entra ID.

## Prerequisites

Before you start to configure SSPR, you need a:

- **Microsoft Entra organization**: This organization must have at least a P1 or P2 trial license enabled.
- **Microsoft Entra account with Authentication Policy Administrator role**: You'll use this account to set up SSPR.
- **Non-administrative user account**: You'll use this account to test SSPR. It's important that this account isn't an administrator, because Microsoft Entra imposes extra requirements on administrative accounts for SSPR. This user, and all user accounts, must have a valid license to use SSPR.
- **Security group with which to test the configuration**: The non-administrative user account must be a member of this group. You'll use this security group to limit who you roll SSPR out to.

## Scope of SSPR rollout

There are three settings for the **Self-service password reset enabled** property:

- **None**: No users in the Microsoft Entra organization can use SSPR. This value is the default.
- **Selected**: Only the members of the specified security group can use SSPR. You can use this option to enable SSPR for a targeted group of users who can test it and verify that it works as expected. When you're ready to roll it out broadly, set the property to **Enabled** so that all users have access to SSPR.
- **All**: All users in the Microsoft Entra organization can use SSPR.

## Configure SSPR

Here are the high-level steps to configure SSPR:

1. Go to the [Azure portal](https://portal.azure.com/), then to **Microsoft Entra ID** > **Manage** > **Password reset**.
    
2. **Properties**:
    
    - Enable SSPR.
    - You can enable it for all users in the Microsoft Entra organization or for selected users.
    - To enable for selected users, you must specify the security group. Members of this group can use SSPR.
    
    ![Screenshot of the Password Reset configuration panel. Properties option is selected allowing user to enable self service password resets.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-enable-sspr.png)
    
3. **Authentication methods**:
    
    - Choose whether to require one or two authentication methods.
    - Choose the authentication methods that the users can use.
    
    ![Screenshot of the Password Reset panel's Authentication methods option selected displaying panel with authentication options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-auth-methods.png)
    
4. **Registration**:
    
    - Specify whether users are required to register for SSPR when they next sign in.
    - Specify how often users are asked to reconfirm their authentication information.
    
    ![Screenshot of the Password Reset panel's Registration option selected displaying panel with registration options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-registration-options.png)
    
5. **Notifications**: Choose whether to notify users and administrators of password resets.
    
    ![Screenshot of the Password Reset panel's Notification option selected displaying panel with notification options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-notification-settings.png)
    
6. **Customization**: Provide an email address or web page URL where your users can get help.
    
    ![Screenshot of the Password Reset panel's Customization option selected displaying panel with helpdesk options.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/3-customization-settings.png)


# Exercise - Set up self-service password reset

In this unit, you'll configure and test self-service password reset (SSPR) by using your email. You'll need to use your email to complete the password-reset process in this exercise.

## Create a group

You want to roll out SSPR to a limited set of users first to make sure your SSPR configuration works as expected. Let's begin by creating a security group for the limited rollout.

1. In the Microsoft Entra organization you created, under **Manage**, select **Groups**.
    
2. Select **New Group**.
    
3. Enter the following values:

|Setting|Value|
|---|---|
|Group type|Security|
|Group name|SSPRTesters|
|Group description|Members are testing the rollout of SSPR|
|Membership type|Assigned|
    
4. Select **Create**.
    
    ![Screenshot that shows new group form filled out and the create button highlighted.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/4-create-group.png)
    

## Create a user account

To test your configuration, create an account that's not associated with an administrator role. You'll also assign the account to the group you created.

1. In your Microsoft Entra organization, under **Manage**, select **Users**.
    
2. Select **+ New user**, select **Create new user** in the drop-down, and use the following values:
    
    |Setting|Value|
    |---|---|
    |User principal name|balas|
    |Display name|Bala Sandhu|
    |Password|Select the **Copy** icon next to the autogenerated password, then paste the password to a text editor like Notepad.|
    
3. Select the **Assignments** tab.
    
4. Select **Add group**, check the box for the **SSPRTesters** group, and then the **Select** button.
    
5. Select **Review + create** and then select **Create**.
    

## Enable SSPR

Now, you're ready to enable SSPR for the group.

1. In your Microsoft Entra organization, under **Manage**, select **Password reset**.
    
2. On the **Properties** page, select **Selected**. Select the link under **Select Group**, select the box next to the **SSPRTesters** group, and then the **Select** button.
    
3. Select **Save**.
    
    ![Screenshot of the Password Reset properties panel wwith SSPR enabled and selected group set to SSPRTesters.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/4-choose-sspr-group.png)
    
4. Under **Manage**, select the **Authentication methods**, **Registration**, and **Notifications** pages to review the default values. Ensure **Authentication methods** has **Email** selected.
    
5. Select **Customization**.
    
6. Select **Yes**, and then in the **Custom helpdesk email or URL** text box, enter **admin@organization-domain-name.onmicrosoft.com**. Replace "organization-domain-name" with the domain name of the Microsoft Entra organization you created. If you've forgotten the domain name, hover over your profile in the Azure portal.
    
7. Select **Save**.
    

## Register for SSPR

Now that the SSPR configuration is complete, register an email for the user you created.

 Note

If you get a message that says "The administrator has not enabled this feature," use private/incognito mode in your web browser.

1. In a new browser window, go to [https://aka.ms/ssprsetup](https://aka.ms/ssprsetup).
    
2. Sign in with the user name **balas@organization-domain-name.onmicrosoft.com** and the password that you noted earlier. Remember to replace "organization-domain-name" with the domain name of the Microsoft Entra organization you created.
    
3. If you're asked to update your password, enter a new password of your choice. Make sure you note the new password.
    
4. Select the **Security info** tab, and then select **+ Add sign-in method**.
    
5. In the **Add a method** box, select **Email**.
    
6. Enter your email details.
    
    ![Screenshot that shows mobile phone registration form for SSPR.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/4-register-email.png)
    
7. When you receive the code in your email, enter the code in the text box and select **Next**.
    

## Test SSPR

Now, let's test whether the user can reset their password.

1. In a new browser window, go to [https://aka.ms/sspr](https://aka.ms/sspr).
    
2. For **User ID**, type **balas@organization-domain-name.onmicrosoft.com**. Replace "organization-domain-name" with the domain you used for your Microsoft Entra organization.
    
    ![Screenshot that shows the password reset dialog.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/4-start-password-reset.png)
    
3. Complete the CAPTCHA and select **Next**.
    
4. The **Email my alternate email** radio button is selected. Select **Email**.
    
5. When the email arrives, in the **Enter your verification code** text box, enter the code you were sent. Select **Next**.
    
6. Enter a new password, and then select **Finish**. Make sure you note the new password.
    
7. Close the browser window.