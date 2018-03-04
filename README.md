nspiration
In the wake of the tragic shootings in schools, concerts, and other venues in recent months, the GunSafe team felt moved to act. At the very least, our goal was to lay the groundwork for further development of a cost-effective approach to enhancing the detection of firearms in real-time so that further tragedies such as in Orlando and Las Vegas can be prevented before they occur.

## What it does
It uses a system of wifi beacons (RFID or Bluetooth beacons in a real-world implementation) that would be placed around a safe zone that can detect when a certain device ("the chip") enters the network's range. When this chip, which would be attached to a firearm in such a way that removal or tampering is impossible, this system sends an alert to the owners of the venue or location (think school principal, resource officer/security personnel). This alert not only notifies, but also provides real-time data about the incident. (Location of the firearm, the firearm's serial number, and the time and date.)

## How we built it
We used a Raspberry Pi that hosts a JSON file on a server to act as a stand-in of the chip. The beacon then scans the network for any device whose hostname fits a pattern, and then sends an alert via. a JSON API to the central alert system and database. After that, the alert is displayed on the screen with the current real-time data.

## Challenges we ran into
Integrating a complex API endpoint into the workflow of the app without time to write proper tests that fully cover functionality proves to be quite difficult.

## Accomplishments that we're proud of
Getting the system working with the basic functionality that allows for the current team or any future contributors to quickly advance the development of this system.

## What we learned
Integrating a JSON API and scanning a network for hostname.

## What's next for GunSafe
The current structure of the application is only for a proof-of-concept of the web-based backend. In a future, real-world implementation, the wifi-based beacon will be replaced with some form of passive signal, most likely an RFID beacon that can trigger a chip that would be hypothetically required as part of future gun sales. In this future implementation however, the web-based backend could remain the same with only the detection mechanism needing to be modified.
