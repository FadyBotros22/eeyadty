class HeaderConstants {
  const HeaderConstants();

  static const authorization = 'authorization';
}

class AuthConstants {
  const AuthConstants();

  static const _authRoute = '/employeeAuth';
  static const createGuestUser = '$_authRoute/guest';
  static const extendToken = '$_authRoute/extendToken';
  static const appleSignIn = '$_authRoute/apple';
  static const googleSignIn = '$_authRoute/google';
  static const sendOtp = '$_authRoute/sendOtp';
  static const verifyOtp = '$_authRoute/verifyOtp';
  static const updateFcmToken = '$_authRoute/updateFcmToken';
  static const updateDeviceId = '$_authRoute/updateDevice';
  static const logout = '$_authRoute/logout';
  static const minimumAppVersion = '$_authRoute/minimumAppVersion';
}

class AdminEmployeeConstants {
  const AdminEmployeeConstants();

  static const _adminEmployeeRoute = '/adminEmployee';
  static const employees = '$_adminEmployeeRoute/employees';
  static const menuCategories = '$_adminEmployeeRoute/menuCategories';
  static const services = '$_adminEmployeeRoute/services';
  static const packages = '$_adminEmployeeRoute/packages';
  static const categories = '$_adminEmployeeRoute/categories';
  static const coupons = '$_adminEmployeeRoute/coupons';
}

class EmployeeConstants {
  const EmployeeConstants();
  static const deviceIdPath = 'deviceId';

  static const _employeeRoute = '/employees';
  static const profile = '$_employeeRoute/profile';
  static const services = '$_employeeRoute/services';
  static const timeSlots = '$_employeeRoute/timeSlots';
  static const reviews = '$_employeeRoute/reviews';
  static const clients = '$_employeeRoute/clients';
  static const performance = '$_employeeRoute/performance';
  static const unreadNotificationsCount =
      '$_employeeRoute/unreadNotificationsCount';
  static const languages = '$_employeeRoute/devices/{$deviceIdPath}/languages';
}

class ReviewsConstants {
  static const reviewsRoute = '/reviews';
  static const ratingCount = '$reviewsRoute/ratingCount';
  static const reviewsReport = 'reviews-report';
  static const reviewsLike = 'reviews-like';
}

class NotificationConstants {
  const NotificationConstants();

  static const notificationList = '/merchantNotifications';
  static const markNotificationRead =
      '/merchantNotifications/{notificationId}/markAsRead';
}

class BookingsConstants {
  const BookingsConstants();

  static const bookingsList = '/merchantBookings';
  static const bookingDetails = '/merchantBookings/{bookingId}';
  static const addNoteAboutCustomer =
      "/merchantBookings/{bookingId}/customerNotes";
  static const paymentSummary = '/merchantBookings/paymentSummary';
  static const services = '/merchantBookings/services';
  static const slots = '/merchantBookings/availableSlots';
}

class CalendarConstants {
  const CalendarConstants();

  static const calendar = '/calendar';
  static const services = '$calendar/services';
}

class BranchConstants {
  const BranchConstants();
  static const branches = '/branches';
  static const branchData = '/branches/{id}';
}