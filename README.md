# Ty'Mouet - Seagull Rentals in Brittany 🏠 🐦

## About
🌐 [See project](https://ty-mouet-c5897a5b74b0.herokuapp.com/)

Ty'Mouet is an Airbnb clone developed during Le Wagon bootcamp. We had to make a clone which was funny because we couldn't make it about house rentals (it would be boring) so we decided to make it about seagulls 😂 This web application allows users to list their mouettes for rent and travelers to book them for their stays in Brittany. It was our first team project, showcasing how to make a CRUD app with user authentications and responsive pages.

## Technologies Used 🛠️

### Backend
- Ruby on Rails 7.1.5 - Main web framework
- PostgreSQL - Relational database
- Devise - User authentication
- Cloudinary - Media management
- Geocoder - Geolocation services

### Frontend
- Hotwire (Turbo & Stimulus) - Dynamic interactions
- Bootstrap 5.2 - CSS framework
- SASS - CSS preprocessor
- Mapbox GL - Interactive mapping
- Importmap Rails - JavaScript asset management

### Tools & Services
- Cloudinary - Image storage
- PostgreSQL - Database

## Key Features ⭐

### Rentals Management 🏠
- Listing creation and management
- Booking system
- Mouettes mapping
- Location and availability filtering

### User Space 🤝
- Custom profiles
- Booking history
- Rating system
- Personalized dashboard

### Geolocation Features 🗺️
- Mouettes search
- Interactive mapping
- Distance calculation
- Location-based suggestions

### Responsive Interface 📱
- Mobile-first adaptive design
- Smooth navigation
- Performance optimization
- Intuitive user interface

## Project Structure 📂
```
app/
├── assets/         # Static assets
├── controllers/    # Business logic
├── models/         # Data models
├── views/          # Templates
├── javascript/     # JS code
└── services/       # Business services

config/
├── routes.rb       # Application routes
└── database.yml    # DB configuration

db/
└── schema.rb       # Database schema
```

## Local Installation 💻

### Clone the repository
```bash
git clone https://github.com/filexf/ty-mouet.git
cd ty-mouet
```

### Install dependencies
```bash
bundle install
```

### Database setup
```bash
rails db:create db:migrate db:seed
```

### Environment variables
Create a `.env` file in the project root:
```
CLOUDINARY_URL=your_cloudinary_url
MAPBOX_API_KEY=your_mapbox_key
```

### Start the server
```bash
rails server
```

Access the application at http://localhost:3000

Developed with ❤️ during Le Wagon bootcamp
