# DMTool Changelog

[中文](./CHANGELOG.md) | [EN](./CHANGELOG.en.md)

#### Version Update Notes

- **[V2.1.9.4] - 2026.9.17**

  ##### Main Updates:


  - Serial port display supports ANSI color coding
  - Post-write parameter verification can now be optionally disabled to improve CAN write parameter efficiency; pre-write verification is not yet available for disabling; removed the logic that skips writing when parameters are unchanged

  ##### Bug Fixes:

  - Fixed calibration crash issue
  - Fixed issue where some parameter writes were ineffective
  - Fixed the issue where USB2CAN module could not correctly use CAN queue sending functionality

- **[V2.1.9.3] - 2026.9.10**

  ##### Main Updates:


  - Added a checkbox in the settings interface to disable verification code confirmation

  ##### Bug Fixes:

  - Completed missing translations
  - Fixed output shaft calibration related issues
- **[V2.1.9.2] - 2026.9.8**

  ##### Main Updates:


  * Queue sending now supports cyclic mode with configurable send count and interval

  ##### Bug Fixes:

  * Special motor output shaft detection now determines communication type based on the special calibration settings instead of the currently selected UART/CAN
- **[V2.1.9.1] - 2026.9.7**

  ##### Main Updates:


  - Calibration results are now displayed even when 6216 special motor calibration fails
  - Added calibration verification code input and "Strictly prohibited to operate under load" warning

  ##### Bug Fixes:

  - Fixed the issue where the special task flow did not support selecting UART/CAN mode
  - Fixed the issue where CAN ID / Master ID were not correctly updated after reading/writing parameters
- **[V2.1.9.0] - 2026.9.3**

  ##### Main Updates:


  - Added CAN queue sending function (shortcut key F1)
  - Added serial port passthrough function
  - Added parameter fool-proofing and post-write verification
  - Parameter import/export now includes version number
  - Added right-click drag zoom for the waveform control

  ##### Bug Fixes:

  - Frame parsing changed from fixed-length reading to search-based pulling
- **[V2.1.8.6] - 2026.8.7**

  ##### Main Updates:


  - Added firmware fool-proofing and output shaft detection; the About page now allows toggling firmware fool-proofing

  ##### Bug Fixes:

  - Fixed abnormal task conflict errors
  - Fixed serial port data transmission errors with 1-to-4 firmware
- **[V2.1.8.5] - 2026.8.5**

  ##### Main Updates:


  - Added extended parameter read/write (KP_MAX, KD_MAX), requires firmware support
  - Added 6216 special motor support

  ##### Bug Fixes:

  - Fixed MIT slider range binding error
- **[V2.1.8.4] - 2026.7.15**

  ##### Main Updates:


  - Added CAN analyzer data filtering: supports six-column filtering (frame type, frame format, CAN type, CAN
    ID, status, data length)
  - Task gating now covers more scopes: calibration, parameter calibration, read/write parameters, read version, and firmware upgrade are all under unified management to prevent concurrent execution conflicts. Devices are automatically stopped and UI is restored when disconnected

  ##### Bug Fixes:

  - Fixed the issue where firmware upgrade via CAN was not possible on version 2183
  - Fixed the issue where hot-plugging during firmware upgrade did not correctly stop tasks and restore UI
- **[V2.1.8.3] - 2026.7.9**

  ##### Main Updates:


  - Added task gating to prevent duplicate execution of ongoing tasks

  ##### Bug Fixes:

  - Motor feedback information in the debug interface now initially displays "Na" instead of uninitialized values
  - Fixed abnormal CAN ID input box style when modification is not allowed in CAN mode
  - CAN analyzer send interface now correctly switches back to CAN 2.0 send page after closing the device
  - Fixed CAN ID / Master ID input upper limit in the parameter settings interface

- **[V2.1.8.2] - 2026.7.3**

  ##### Main Updates:


  - Add CAN-based calibration selection for special motors

  ##### Bug Fixes:

  - Fix issue where serial port cannot correctly print Latin characters
  - Fix device open failure issue
  - Fix data slider mapping error in debug interface
- **[V2.1.8.1] - 2026.6.29**

  ##### Main Updates:


  - Add motor firmware repository: browse, search, and download motor firmware
  - Add double-confirmation protection for calibration operations

  ##### Bug Fixes:

  - Fix timestamp sorting in CAN analyzer
- **[V2.1.8.0] - 2026.6.24**

  ##### Main Updates:


  - Add motor latest firmware detection: automatically detect whether motor firmware has updates and pull updates to local
  - Add some tooltips

  ##### Bug Fixes:

  - Fix abnormal window scaling in motor firmware upgrade dialog
  - Fix abnormal CAN version reading issue
- **[V2.1.7.1] - 2026.6.16**

  ##### Main Updates:


  - Refactored abstract device display logic: for unregistered non-DM series modules, now display device descriptors directly
  - restored USB2CAN hot-plug functionality

  ##### Bug Fixes:

  - Store CANOpen EDS database in user data directory to fix permission issues causing database access failure
  - When refreshing serial ports, no longer filter out unopenable devices, and block Bluetooth serial ports to fix UI lag caused by standard serial port refresh on boards with Bluetooth connections
  - No longer filters out already opened devices (USB2485 devices have long initialization time, which could cause UI lag during hot-plug events)
  - Fixed crash issue where USB2FDCAN hot-plug stopped working after firmware upgrade
- **[V2.1.7.0] - 2026.6.12**

  ##### Main Updates:


  - Abstracted device layer; unified display as USB2CAN, USB2FDCAN[SINGLE], USB2FDCAN[DUAL], and USB2FDCAN[GSUSB]

  ##### Bug Fixes:

  - Blocked `tty.Bluetooth-Incoming-Port` on macOS
- **[V2.1.6.9] - 2026.6.8**

  ##### Main Updates:


  - Added software configuration registry to remember user settings such as baud rate and language
  - Upgraded serial port queue sending (supports grouping and mixed ASCII/HEX)
  - Parameter setting interface supports adjusting CAN ID and Master ID using mouse wheel

  ##### Bug Fixes:

  - Fixed linkage issues between waveform history and mouse wheel zoom/drag
- **[V2.1.6.8] - 2026.6.3**

  ##### Bug Fixes:


  - Fixed an intermittent motor-side calibration failure issue on V3 firmware
- **[V2.1.6.7] - 2026.5.29**

  ##### Major Updates:


  - Added mouse wheel zoom, mouse drag, point auto-snapping, slope calculation, and history data display features to the waveform control
- **[V2.1.6.6] - 2026.5.27**

  ##### Major Updates:


  - Removed the read ID and set ID buttons from the debug interface

  ##### Bug Fixes:

  - Fixed waveform control lag and excessive memory usage
  - Fixed missing 125K baud rate setting for USB2CAN modules
- **[V2.1.6.5] - 2026.5.20**

  ##### Bug Fixes:


  - Fixed incorrect binding issue between dual USB2CAN modules
- **[V2.1.6.3] - 2026.5.18**

  ##### Major Updates:


  - Adapted FDCAN module for opening and upgrading special SLCAN and GSUSB firmware; the bottom-left status bar now displays the special firmware name

  ##### Bug Fixes:

  - Fixed FDCAN module firmware upgrade issues
  - Fixed abnormal behavior after multiple calibrations of the output axis
- **[V2.1.6.2] - 2026.5.12**

  ##### Major Updates:


  - Optimized the waveform widget
  - Optimized serial-port refresh response speed
  - Added a prompt for failures caused by old FDCAN module firmware: please update the FDCAN module to the latest firmware (single-channel modules must be updated to 1004 or later)!
  - Removed the FDCAN module refresh button from the F2 device configuration page and replaced it with a restore factory button

  ##### Bug Fixes:

  - Fixed edge-jump issues in the waveform widget
  - Fixed software crashes when opening FDCAN modules with old firmware
  - Fixed the issue where hot-plugging could not correctly identify the FDCAN module in certain cases
- **[V2.1.6.1] - 2026.4.29**

  ##### Major Updates:


  - Added prompts for modifying pole pairs / reduction ratio through the serial port

  ##### Bug Fixes:

  - Fixed the invalid firmware-format issue caused by copying the firmware path
- **[V2.1.6.0] - 2026.4.17**

  ##### Major Updates:


  - Optimized the USB2CAN module user experience
  - Optimized the waveform widget
  - Optimized device scanning and device binding logic: opened devices are no longer displayed, and the selected serial port number is automatically bound to the libusb device port
  - The CAN analyzer now distinguishes and displays standard FDCAN frames and FDCAN accelerated frames
  - Added a host software manual link to the About page
  - Enabled modification of pole pairs and reduction ratio through the serial port

  ##### Bug Fixes:

  - Fixed brief stuttering when toggling the serial port on and off
  - Fixed issues related to bus channel utilization calculation
  - Fixed waveform delay, jagged behavior, and inability to adjust transmission interval when debugging with the USB2CAN module
  - Fixed the invalid-length prompt when sending zero-length frames in the CAN analyzer, removed the dynamic length limit on sent data, and prevented data from being cleared by mistake
  - Fixed the custom baud-rate configuration logic
  - Fixed serial output text to use a monospace font so serial print information is displayed correctly
  - Fixed the issue where CAN communication with the motor could not work at 3.2M when using FDCAN module firmware 1007
- **[V2.1.5.3] - 2025.12.15**

  ##### Bug Fixes:


  - Fixed incorrect error-frame counting
- **[v2.1.5.2] - 2025.12.12**

  ##### Major Updates


  - Adapted to new firmware for the `usb2canfd_dual` module and the single-channel `usb2fdcan` module (single-channel firmware requires v1.0.0.4 or later), and added error-frame counting

  ##### Bug Fixes:

  - Fixed incorrect index counting in the CAN analyzer
  - Fixed incorrect display of feedback-frame error codes (for example, 0x08 displayed as 0xf8)
- **[v2.1.4.6] - 2025.11.20**

  ##### Major Updates


  - Added support for big-endian/little-endian conversion of 1-byte and 2-byte data

  ##### Bug Fixes:

  - Fixed parameter-reading errors on the V2 driver board
  - Fixed the issue where HEX values in imported EDS files could not be parsed correctly
- **[v2.1.4.5] - 2025.11.18**

  ##### Bug Fixes:


  - Fixed feedback-frame parsing errors
- **[v2.1.4.4] - 2025.11.14**

  ##### Major Updates:


  - Added USB2CAN module baud-rate configuration to the device configuration page

  ##### Bug Fixes:

  - Fixed the issue where changing the frame ID in the CAN analyzer did not take effect immediately
- **[v2.1.4.2] - 2025.11.5**

  ##### Major Updates:


  - Supports gsusb firmware
  - CANOpen-related pages are hidden by default and are shown after CANOpen is checked in the settings page
  - Hardware timestamp sorting is disabled by default and can be enabled from the settings page
- **[v2.1.4.0] - 2025.11.3**

  ##### Major Updates:


  - Supports CANOpen (EDS dictionary import, SDO read/write, and graphical PDO mapping configuration)
  - Added a settings page (allows free configuration of the number of data points displayed by the waveform widget)

  ##### Bug Fixes:

  - Fixed the crash caused by configuring a custom baud rate when the FDCAN device was not opened
- **[v2.0.3.7] - 2025.10.10**

  ##### Bug Fixes:


  - Used hardware timestamps to sort data frames, fixing the issue where debug waveforms showed abnormal states due to out-of-order data
- **[v2.0.3.6] - 2025.9.30**

  ##### Major Updates:


  - Added periodic mode (periodic position, periodic speed, periodic torque)
  - The status bar displays the motor baud rate from the power-on print information
  - Waveform drawing in the debug interface is now always enabled
- **[v2.0.3.5] - 2025.9.23**

  ##### Major Updates:


  - Adjusted the waveform widget style
  - Improved motor baud-rate updates in the status bar
  - Added a data-field acceleration option to the CAN analyzer under FDCAN

  ##### Bug Fixes:

  - Fixed extra line breaks in power-on print information
  - Fixed the issue where CAN frames could not continue to be received normally after hot-plugging
  - Fixed incorrect upper and lower slider limits after switching RPM in MIT mode
  - Fixed data-mapping errors caused by range parameters on the debug page not being updated correctly after writing parameters
  - Fixed incorrect RPM conversion in PVT mode
- **[v2.0.3.4] - 2025.9.15**

  ##### Major Updates:


  - Added USB2FDCAN module and motor baud-rate prompts to the status bar
  - Added custom baud-rate configuration for the USB2FDCAN module

  ##### Bug Fixes:

  - Fixed ASCII/HEX conversion errors
  - Cleared endpoints after reception, fixing the issue where the lower-level device could become blocked
- **[v2.0.3.3] - 2025.9.10**

  ##### Major Updates:


  - Added special motor selection (H6215 hub motor, special calibration, and parameter calibration)
  - Allowed region selection and copying in the CAN analyzer

  ##### Bug Fixes:

  - Filtered non-printable characters in the serial data display box, fixing garbled printed data
- **[v2.0.3.2] - 2025.9.8**

  ##### Major Updates:


  - Added an About page

  ##### Bug Fixes:

  - Fixed the issue where CAN and serial data were not properly separated under the USB2CAN module
- **[v2.0.3.1] - 2025.9.4**

  ##### Bug Fixes:


  - Fixed the extended frame ID length limitation
  - Fixed abnormal Y-axis display in the waveform save widget
- **[v2.0.3.0] - 2025.9.2**

  ##### Major Updates:


  - Optimized serial port switch speed
  - Optimized adaptive adjustment of the Y-axis scale in the waveform widget

  ##### Bug Fixes:

  - Fixed abnormal software crashes
  - Reading and writing parameters with CAN in the enabled state no longer causes power loss
- **[v2.0.2.9] - 2025.8.25**

  ##### Major Updates:


  - Restored the old host-software style for the debug and parameter settings pages
  - Changed the control block diagram display format to table + text box + image
  - Added multi-curve save support to the waveform widget

  ##### Bug Fixes:

  - Changed the default CAN ID to 0x01 and displayed the default ID at the same time
- **[v2.0.2.8] - 2025.8.21**

  ##### Major Updates:


  - Added serial receive settings (whether to display and the display base)
  - Substantially adjusted the UI layout (moved part of the serial configuration into device configuration, added a serial queue send button, and hid the calibration tab by default)

  ##### Bug Fixes:

  - Filled in the missing FDCAN transmission length of 48
- **[v2.0.2.7] - 2025.8.19**

  ##### Major Updates:


  - Added arbitrary zoom support for the main interface.
  - Added a function that automatically switches the control-mode tab on the debug page according to the motor mode read after reading parameters.
  - Added a sampling-point display function to the FDCAN device configuration page.
  - Removed the frame parsing feature.

  ##### Bug Fixes:

  - Fixed speed mapping restrictions outside MIT mode
  - Fixed the white tooltip window issue
  - Fixed the calibration tab misalignment issue
- **[v2.0.2.7-trial] - 2025.8.14**

  ##### Major Updates:


  - Added arbitrary zoom support for the main interface. This is currently only a trial version and will be optimized later.
- **[v2.0.2.6] - 2025.8.13**

  ##### Major Updates:


  - Added serial-port list sending, opened with F3. It allows convenient customization of the serial send list and send interval.
  - Added local storage for runtime crash logs, but it only takes effect after the executable file is extracted. Logs are stored in the `logs` folder.

  ##### Bug Fixes:

  - Enabled input-box formatting when sending serial data in Hex format to correctly restrict input characters.
  - Fixed the issue where formatted input could incorrectly reset the selection, causing Ctrl key combinations to fail.
  - Fixed the issue where the reduction ratio `Gr` could not be imported correctly during parameter import.
- **[v2.0.2.5] - 2025.8.7**

  ##### Major Updates:


  - Rewrote the logic for scanning devices on the bus, allowing more accurate identification of devices present on the bus;
  - At the same time, retained the broadcast read/write ID function on the debug page and added a secondary confirmation dialog to prevent accidental operations.

  ##### Bug Fixes:

  - Fixed the firmware upgrade failure caused by changing the CAN frame transmission interval;
  - Fixed the issue where reading and writing parameters with a USB2CAN device could cause frame stalls.
