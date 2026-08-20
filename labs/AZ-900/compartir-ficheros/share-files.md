# Guided project: Share files securely.

[Link](https://learn.microsoft.com/en-us/training/modules/guided-project-share-files-securely/)

# Introduction.
This guided project focuses on sharing files securely using Azure Blob Storage, shared access signatures (SAS), and lifecycle management.
A shared access signature (SAS) is a token that grants temporary, scoped access to a blob or container without sharing your storage account keys. When you generate a SAS from a stored access policy, the policy acts as a central control point—you can revoke all linked tokens instantly by deleting the policy.

## Scenario

Your internal finance team needs to share monthly reports with an external partner for a short review window. You upload the report to a private container, set up a stored access policy, generate a SAS link from that policy, and then test both sides of the access model—confirming the partner can access the file with the SAS while anonymous access stays blocked. When the review is complete, you revoke access by deleting the policy and configure a lifecycle rule to automatically clean up shared files.

- Exercise 1 - Create a storage account, private container, and upload a file.
- Exercise 2 - Create a stored access policy and generate a SAS link.
- Exercise 3 - Test that SAS access works and direct access is blocked.
- Exercise 4 - Revoke partner access by deleting the stored access policy.
- Exercise 5 - Configure lifecycle management to auto-delete files after 30 days.

![[labs/AZ-900/compartir-ficheros/overview-architecture.png]]

# Exercise - Create storage and upload file.

## Task 1: Prepare the environment.

1. Sign in to the [Azure portal](https://portal.azure.com/) with an account that has permissions to create storage resources.
2. In the portal search bar, search for **Resource groups** and select **Resource groups**.
3. Select **+ Create**.
4. For **Name**, enter **rg-gp-file-exchange**.
5. For **Region**, choose your preferred region.
6. Select **Review + create** and then select **Create**.

## Task 2: Create the storage account

Set up the foundation for blob storage. The storage account holds your blob containers and files with full encryption at rest and in transit.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select **+ Create**.
3. On the **Basics** tab, select **rg-gp-file-exchange** as the resource group.
4. For **Storage account name**, enter a globally unique name such as **stgpfilexchg** followed by your initials and a number.
5. For **Region**, choose the same region as the resource group.
6. For **Preferred Storage Type**, select **Azure Blob Storage or Azure Data Lake Storage Gen 2**.
7. For **Performance**, select **Standard**.
8. For **Redundancy**, select **Locally-redundant storage (LRS)**.
9. Select **Review + create** and then **Create**.
10. After deployment, select **Go to resource**.

## Task 3: Create the private container

Create a container with private access settings. This ensures that even if someone discovers the container URL, they cannot list or access blobs without explicit permissions like a SAS token.

1. In the left menu, under **Data storage**, select **Containers**.
2. Select **+ Container**.
3. For **Name**, enter **partner-drop**.
4. For **Anonymous access level**, leave **Private (no anonymous access)** selected.
5. Select **Create**.

## Task 4: Upload the report file

Add your file to the container. Once uploaded, only users with explicit permissions or a valid SAS token will be able to download it.

1. On your local machine, create a text file named **monthly-report.txt** with the following content:

```text
Monthly Partner Report
Status: Complete
Items processed: 142
Storage tier: Standard
Compliance check: Passed
Next review: Scheduled
```

2. In the Azure portal, select the **partner-drop** container to open it.
3. Select **Upload**.
4. Select **Browse for files**, select **monthly-report.txt**, and then select **Upload**.
5. Confirm **monthly-report.txt** appears in the blob list.

# Exercise - Create an access policy and generate a SAS link
## Task 1: Create a stored access policy

Define a reusable access policy on the container that controls what SAS tokens can do and when they expire.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select the storage account you created (for example, **stgpfilexchg**).
3. In the left menu, under **Data storage**, select **Containers**.
4. Select the **partner-drop** container.
5. In the left menu, under **Settings**, select **Access policy**.
6. Under **Stored access policies**, select **+ Add policy**.
7. For **Identifier**, enter **partner-read-policy**.
8. For **Permissions**, select **Read** only.
9. For **Start time**, set the date to today's date. The time defaults to 12:00:00 AM, which means the policy is effective immediately.
10. For **Expiry time**, set it to 1 hour from now.
11. Select **OK**.
12. Select **Save** at the top of the page.
## Task 2: Generate a SAS from the stored access policy

Now generate a SAS token that inherits its rules from the policy you just created.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select your storage account (for example, **stgpfilexchg**).
3. In the left menu, under **Data storage**, select **Containers**.
4. Select the **partner-drop** container.
5. Select **monthly-report.txt** to open the blob settings.
6. Select **Generate SAS**.
7. For **Stored access policy**, select **partner-read-policy** from the dropdown.
8. Select **Generate SAS token and URL**.
9. Copy the **Blob SAS URL** and save it securely. You'll use this URL in the next exercise.

# Exercise - Test partner access behavior.

## Task 1: Verify direct access is blocked

Confirm that the container's private access setting properly prevents unauthorized direct access without a SAS token.

1. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
2. Select your storage account (for example, **stgpfilexchg**).
3. In the left menu, under **Data storage**, select **Containers**.
4. Select the **partner-drop** container.
5. Select **monthly-report.txt** to open the blob properties.
6. Copy the **URL** field (this is the direct blob URL without a SAS token).
7. Open a new incognito or private browser window.
8. Paste the direct URL into the address bar and press **Enter**.
9. Confirm access is denied with an authentication error.

## Task 2: Test SAS access

Now verify that the policy-based SAS token grants access to the same file that was just blocked. This simulates how an external partner would securely access the shared file.
1. In the same incognito window, paste the SAS URL into the address bar and press **Enter**.
2. Confirm the file content displays in the browser. Because this is a text file, the browser renders it directly instead of downloading it.
3. Note that you are not signed in but still have access due to the SAS token.
4. Keep this incognito window open—you'll use it again in the next exercise.
# Exercise - Revoke partner access.

## Task 1: Confirm SAS still works

Before revoking, verify that the SAS URL is still active so you can see the before-and-after contrast.
1. In the incognito window you kept open, refresh the SAS URL.
2. Confirm the file content still displays. The SAS token is still valid.
## Task 2: Delete the stored access policy

Remove the policy to instantly revoke all SAS tokens that were generated from it.
1. Return to the Azure portal in your main browser window.
2. In the portal search bar, search for **Storage accounts** and select **Storage accounts**.
3. Select your storage account (for example, **stgpfilexchg**).
4. In the left menu, under **Data storage**, select **Containers**.
5. Select the **partner-drop** container.
6. In the left menu, under **Settings**, select **Access policy**.
7. Under **Stored access policies**, select the **...** (more options) menu next to **partner-read-policy**.
8. Select **Delete**.
9. Select **Save** at the top of the page.

## Task 3: Verify access is revoked

Test the same SAS URL to confirm it no longer works—even though the token's expiry time hasn't passed.
1. Return to the incognito window.
2. Refresh the SAS URL.
3. Confirm access is now denied with an authorization error.
## Task 4: Confirm the file still exists

Verify that revoking SAS access only removed the external pathway—the file itself is untouched.
1. Return to the Azure portal in your main browser window.
2. Navigate to the **partner-drop** container.
3. Confirm **monthly-report.txt** still exists in the container.
4. Close the incognito window.

