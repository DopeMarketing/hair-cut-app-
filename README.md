# Hair Cut App

A Next.js web application that analyzes user-uploaded photos to determine optimal haircut timing based on hair growth patterns and desired style maintenance.

## Features

- **Photo Upload and Analysis**: Upload photos of your hair to track growth patterns
- **Hair Growth Tracking**: Monitor hair growth over time with detailed analytics
- **Personalized Recommendations**: Get customized suggestions for when to schedule your next haircut
- **Smart Reminders**: Receive notifications when it's time for your next cut
- **Style Preferences**: Set and maintain your preferred hair length and style

## Tech Stack

- **Frontend**: Next.js 15 with App Router, React, TypeScript
- **Styling**: Tailwind CSS
- **Backend**: Supabase (Database + Authentication)
- **Deployment**: Vercel (recommended)

## Getting Started

### Prerequisites

- Node.js 18+ 
- A Supabase project

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd hair-cut-app
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.example .env.local
```

Edit `.env.local` with your Supabase credentials:
```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

4. Run database migrations:
```bash
# Apply the migration to your Supabase project
npx supabase db push
```

5. Start the development server:
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the application.

## Database Schema

### Tables

- **hair_photos**: Stores uploaded photos and analysis data including hair length, growth rate, and cut recommendations
- **user_preferences**: Stores user style preferences, cut frequency, and reminder settings

### Key Features

- Row Level Security (RLS) enabled for data privacy
- UUID primary keys for better security
- Automated timestamps for tracking
- Optimized indexes for performance

## Project Structure

```
├── app/
│   ├── (auth)/
│   │   ├── login/page.tsx
│   │   └── signup/page.tsx
│   ├── dashboard/page.tsx
│   ├── globals.css
│   ├── layout.tsx
│   └── page.tsx
├── lib/
│   └── supabase/
│       ├── client.ts
│       └── server.ts
├── supabase/
│   └── migrations/
│       └── 001_initial.sql
└── middleware.ts
```

## Development

This project uses:
- **Next.js 15** with App Router for modern React development
- **Supabase** for authentication and database management
- **TypeScript** for type safety
- **Tailwind CSS** for responsive styling

## Deployment

The easiest way to deploy is using [Vercel](https://vercel.com):

1. Push your code to GitHub
2. Connect your repository to Vercel
3. Add your environment variables in the Vercel dashboard
4. Deploy

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.