# briefs

Password-protected pages shared with clients and collaborators by Waveform Analytics.

Each page is encrypted before it is committed (AES-GCM, key derived from a
password with PBKDF2-SHA256) and decrypts in the reader's browser. This
repository holds only ciphertext: nothing readable is stored here, and the
passwords are shared separately.

Pages are built elsewhere and copied in with `publish.sh`.
