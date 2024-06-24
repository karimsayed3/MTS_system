# User Management System

## Project Description

The User Management System is a comprehensive application designed to manage user subscriptions and financial transactions efficiently across both desktop and mobile platforms. Developed using Flutter, this project supports three distinct types of users: Admin, Collector, and Distributor, each with tailored functionalities to ensure smooth operations and effective data management.

### User Roles
- **Admin:** 
  - Full control over the application.
  - Manages user accounts, subscriptions, and payments.
  - Oversees data and system settings.
- **Collector:** 
  - Gathers and inputs data into the system.
  - Tracks payments and subscription renewals.
  - Ensures the accuracy and completeness of collected data.
- **Distributor:** 
  - Manages the distribution of resources.
  - Ensures timely and accurate delivery of services.

### Platforms
- **Desktop Application:** 
  - Built using Flutter for a consistent and responsive user experience across various desktop environments.
- **Mobile Application:** 
  - Developed using Flutter to provide a responsive and intuitive interface on both Android and iOS devices.

### Skills & Technologies
- **API Integration:** 
  - Integrates with external services for comprehensive data management.
- **Retrofit:** 
  - Utilized for efficient and scalable API interactions, ensuring reliable communication with backend services.
- **Freezed:** 
  - Implements immutable data classes and unions, providing robust state management and reducing bugs.
- **Bloc State Management:** 
  - Ensures a reactive and predictable data flow, making the application more maintainable and scalable.
- **Native Code Integration:** 
  - Connects with native code to enable features like printing receipts directly from the application.

### Features
- **Subscription Management:** 
  - Track user subscriptions, including renewal dates and end dates.
  - Manage payments, both pending and completed, with detailed date records.
- **Financial Tracking:** 
  - Keep records of payments made and amounts due.
  - Generate and print receipts using native printer integration.
- **Real-time Notifications:** 
  - Keep users informed with real-time updates and notifications about their subscriptions and payments.
- **Cross-platform Support:** 
  - Consistent and seamless user experience across desktop and mobile platforms.

## Installation & Setup

To get started with the User Management System, follow the steps below:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/user-management-system.git
   cd user-management-system

2. **Install Dependencies:**
   ```bash
   flutter pub get

3. **Run the Application:**
   **For Desktop:**
        ```bash
        flutter run -d windows
    **For Desktop:**
            ```bash
            flutter run -d android
## Contributing
We welcome contributions from the community. If you'd like to contribute, please fork the repository and create a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
