# alcapone — Lavalink node for Railway

A ready-to-deploy Lavalink v4 audio server (YouTube + Spotify via LavaSrc).
Push this to GitHub, deploy on Railway, then point your bot at it.

## 1. Put this on GitHub
- Create a new repo (private is fine and recommended).
- Upload these files (`Dockerfile`, `application.yml`, `.gitignore`) to it.

## 2. Deploy on Railway
1. railway.com -> New Project -> **Deploy from GitHub repo** -> pick this repo.
2. Railway detects the `Dockerfile` and builds it automatically.

## 3. Set the secrets (Railway -> your service -> Variables)
Add these three variables (Spotify keys from developer.spotify.com/dashboard):

    LAVALINK_SERVER_PASSWORD            = <pick a strong password>
    PLUGINS_LAVASRC_SPOTIFY_CLIENTID    = <your Spotify client id>
    PLUGINS_LAVASRC_SPOTIFY_CLIENTSECRET= <your Spotify client secret>

(These override the blank values in application.yml, so your keys never sit
in the GitHub repo.) Railway will redeploy after you add them.

If the Spotify env vars don't take effect for some reason, the fallback is to
paste the keys straight into `application.yml` (clientId / clientSecret) in
your **private** repo and redeploy.

## 4. Expose it (Railway -> Settings -> Networking)
- Click **TCP Proxy** and set the target port to **2333**.
- Railway gives you something like:  `roundhouse.proxy.rlwy.net : 41827`
  Note the host and the port number.

## 5. Point the bot at it (alcapone .env)
    LAVALINK_HOST=roundhouse.proxy.rlwy.net      <- your proxy host
    LAVALINK_PORT=41827                          <- your proxy port
    LAVALINK_PASSWORD=<same as LAVALINK_SERVER_PASSWORD>
    LAVALINK_SECURE=false

Restart the bot. You want to see:  [music] Lavalink node "main" connected.

## 6. Test
Join a voice channel:  ,p <spotify or youtube link>

## Notes
- First Railway build downloads the plugins; check the deploy logs for
  `Found plugin 'youtube-plugin'` and `Found plugin 'lavasrc-plugin'`.
- Railway is usage-based (a few $/month for a small node). It runs 24/7 so
  music works even when your PC is off.
- Plugin versions in application.yml were current in early 2026; if a plugin
  fails to load, bump it to the latest from its GitHub releases page.
