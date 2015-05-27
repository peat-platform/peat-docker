#!/bin/bash

redis-server &
node /openi-auth-dialogs/bin/www -s oMF81IOFsZ0bvzSdcBV -p "'-----BEGIN PUBLIC KEY-----\nMFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKT8kGk6ZNo3sC4IIo29leRLVD23T2r0\nvWXBEkk2pV42HsxKAmPs789AGHH9XwbGpD7FvrcBWWgb65v32Hg/NGkCAwEAAQ==\n-----END PUBLIC KEY-----'"
