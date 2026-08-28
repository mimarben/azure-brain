# Exercise - Customize directory branding

Suppose you've been asked to display your retail organization's branding on the Azure sign-in page to reassure users that they're passing credentials to a legitimate system. Here, you'll learn how to configure this custom branding.

To complete this exercise, you must have two image files:

- A page background image. This must be a PNG or JPG file, 1920 x 1080 pixels, and smaller than 300 KB.
- A company logo image. This must be a PNG or JPG file, 32 x 32 pixels, and smaller than 5 KB.

## Customize Microsoft Entra organization branding

Let's use Microsoft Entra ID to set up the custom branding.

1. Sign in to the [Azure portal](https://portal.azure.com/).
    
2. Go to your Microsoft Entra organization by selecting **Microsoft Entra ID**. If you're not in the right Microsoft Entra organization, go to your Azure profile, and select **Switch directory** to find your organization.
    
3. Under **Manage**, select **Company branding**. Then select the **Customize** button in the center of the screen.
    
4. Next to **Favicon**, select **Browse**. Select your logo image.
    
5. Next to **Background image**, select **Browse**. Select your page background image.
    
6. Select a **Page background color** or accept the default.
    
    ![Screenshot that shows the configure company branding form.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/5-customize-ui.png)
    
7. Select **Review + Create**, and then select **Create**.
    

## Test the organization's branding

Now, let's use the account that we created in the last exercise to test the branding.

1. In a new browser window, go to [https://login.microsoft.com](https://login.microsoft.com/).
    
2. Select the account for **Bala Sandhu**. Your custom branding is displayed.
    
    ![Screenshot that shows the customized sign-in page.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/5-custom-login-page.png)
    
3. Select **Forgot my password**.
    
    ![Screenshot that shows organization logo on password reset page.](https://learn.microsoft.com/en-us/training/modules/allow-users-reset-their-password/media/5-forgot-password-branding.png)