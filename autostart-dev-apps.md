# autostart-dev-apps.sh - Start app in order on startup

## Configuration

To set up your Parrot OS system to autostart applications in a specific order when you log into your desktop environment, you can follow these steps:

### 1. **Open the "Startup Applications"**
   - Press `Alt + F2`, then type `gnome-session-properties` or just search for **"Startup Applications"** in your application menu (depending on the desktop environment you're using).
   - If you don’t see the "Startup Applications" tool, you can install it by running the following command in a terminal:
     ```bash
     sudo apt install gnome-startup-applications
     ```

### 2. **Add Applications to Autostart**
   You will need to add each application to the startup list in the correct order. However, most desktop environments execute all applications in parallel by default, so we'll need to use a workaround for ensuring they start in a specific order.

### 3. **Create Startup Scripts with Delays for Order**
   To enforce the order of the startup applications, you can create a shell script that starts each application with a delay, ensuring they launch in the specified sequence.

   **Create a custom script** that runs the applications with a delay:

   - Open a terminal and create a new shell script:
     ```bash
     nano ~/autostart.sh
     ```
   - Add the following content to the script to start the applications in the desired order, with small delays between each launch:

     ```bash
     #!/bin/bash

     # Start Terminal
     gnome-terminal &
     sleep 2

     # Start KeePassXC
     keepassxc &
     sleep 2

     # Start Caja file manager
     caja &
     sleep 2

     # Start VSCodium
     vscodium &
     sleep 2

     # Start ProtonVPN
     protonvpn &
     sleep 2

     # Start Brave Browser
     brave &
     ```

     The `sleep 2` ensures a 2-second delay between the launches. You can adjust the delay as necessary for your system’s performance.

   - Save and exit by pressing `CTRL + X`, then `Y`, and then `Enter`.

### 4. **Make the Script Executable**
   Run the following command to make the script executable:
   ```bash
   chmod +x ~/autostart.sh
   ```

### 5. **Add the Script to Startup**
   Now, you need to add this script to the startup applications list.

   - Open **Startup Applications** (same as step 1).
   - Click **Add** and provide the following:
     - **Name**: `Custom Autostart`
     - **Command**: `/home/your-username/autostart.sh` (replace `your-username` with your actual username)
     - **Comment**: (optional) "Starts apps in a specific order"

   Alternatively, you can add it directly by editing the autostart configuration file:

   ```bash
   nano ~/.config/autostart/custom-autostart.desktop
   ```

   Add the following content:
   ```ini
   [Desktop Entry]
   Type=Application
   Exec=/home/your-username/autostart.sh
   Name=Custom Autostart
   Comment=Starts applications in specific order
   X-GNOME-Autostart-enabled=true
   ```

### 6. **Reboot or Log Out and Log Back In**
   Now, when you log back into your Parrot OS system, the applications will start in the specified order.

---