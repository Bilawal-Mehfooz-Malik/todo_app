Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Try the new cross-platform PowerShell https://aka.ms/pscore6

PS C:\Users\Bilawal Mehfooz> shorebird login:ci
Choose an auth provider Google
The Shorebird CLI needs your authorization to manage apps, releases, and patches on your behalf.

In a browser, visit this URL to log in:

https://accounts.google.com/o/oauth2/v2/auth?client_id=523302233293-eia5antm0tgvek240t46orctktiabrek.apps.googleusercontent.com&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A6283&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&code_challenge=4qngR4AeYqozkx179NGzx0mcPsYp1a3hnF8RHtugHbA&code_challenge_method=S256&state=5wzZySrpmXJXM0Ms6ZJU8PF-eNLD0L2H

Waiting for your authorization...

🎉 Success! Use the following token to login on a CI server:

eyJyZWZyZXNoX3Rva2VuIjoiMS8vMDlBZnVLVmM0OGJhbkNnWUlBUkFBR0FrU053Ri1MOUlyY040QlNLdmhTVElLUHNxYnY0bEw3OXN2NzM2RTZuVE5Pby1nYUM2VGdxdTNoWlBTSGtTekYwYmw4dkhHYUc4aDR4SSIsImF1dGhfcHJvdmlkZXIiOiJnb29nbGUifQ==

Example:

export SHOREBIRD_TOKEN="$SHOREBIRD_TOKEN" && shorebird patch android

PS C:\Users\Bilawal Mehfooz>