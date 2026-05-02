# eeyadty — Clinic App

A Flutter clinic application with client-side booking, built with Supabase as the backend.

---

## Architecture

```
lib/
├── data/
│   ├── preferences/         # SharedPreferences wrapper (UserPreferences)
│   └── remote/
│       └── supabase/        # SupabaseManager — ALL Supabase calls live here
│
├── domain/
│   ├── di/                  # Dependency injection (get_it)
│   ├── models/              # Freezed data models
│   │   ├── user/            # ClientUser
│   │   ├── service/         # ClinicService, ServiceCategory
│   │   └── appointment/     # Appointment, AppointmentStatus
│   ├── repositories/        # Business logic layer
│   └── utils/               # AppColors, AppTextStyles, AppResult
│
└── presentation/
    ├── feature_auth/        # Login + Sign Up screens + AuthBloc
    ├── feature_client/      # Client home + 3 tabs
    │   ├── tabs/services/   # Services browsing + ServicesBloc
    │   ├── tabs/appointments/ # Appointments + AppointmentsBloc
    │   └── tabs/profile/    # Profile + ProfileBloc
    ├── feature_home/        # PersonaSelectionScreen
    ├── navigation/          # RouterGenerator
    ├── splash/              # SplashScreen
    └── widgets/             # Shared UI components
```

---

## Setup

### 1. Supabase

Open `lib/data/remote/supabase/supabase_manager.dart` and replace:

```dart
static const String _supabaseUrl = 'YOUR_SUPABASE_URL';
static const String _supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### 2. Supabase Tables Required

```sql
-- Client profiles
create table client_profiles (
  id uuid primary key references auth.users(id),
  email text,
  full_name text,
  phone_number text,
  avatar_url text,
  date_of_birth text,
  gender text,
  created_at timestamptz default now()
);

-- Service categories
create table service_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  icon_name text
);

-- Services
create table services (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  category text,
  image_url text,
  price numeric,
  duration_minutes int,
  is_popular boolean default false
);

-- Appointments
create table appointments (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references client_profiles(id),
  service_id uuid references services(id),
  appointment_date text,
  appointment_time text,
  status text default 'pending',
  notes text,
  created_at timestamptz default now()
);

-- Available slots
create table available_slots (
  id uuid primary key default gen_random_uuid(),
  service_id uuid references services(id),
  date text,
  time text,
  is_booked boolean default false
);
```

### 3. Supabase Storage

Create a bucket named `avatars` with public access.

### 4. RLS Policies

Enable RLS on all tables and add policies so authenticated users can read/write their own data.

### 5. Code Generation

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### 6. Fonts

Add Outfit font files to `assets/fonts/` or remove the `fonts` section from `pubspec.yaml` to use system fonts.

---

## Doctor Side

The doctor portal is intentionally left as a placeholder (`PersonaSelectionScreen` shows a "coming soon" bottom sheet). When ready, create a `feature_doctor/` folder following the same BLoC pattern.

---

## Flow

```
App Start
  └── AppInitializerScreen (checks SharedPreferences)
        ├── First launch / not registered → PersonaSelectionScreen
        │     ├── Patient → LoginScreen → SignUpScreen
        │     │     └── Success → ClientHomeScreen
        │     │           ├── Tab 0: Services
        │     │           ├── Tab 1: Appointments
        │     │           └── Tab 2: Profile
        │     └── Doctor → "Coming Soon" bottom sheet
        └── Already logged in → ClientHomeScreen
```
