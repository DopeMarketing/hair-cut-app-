-- Create hair_photos table to store user uploaded photos and analysis data
CREATE TABLE hair_photos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    photo_url TEXT NOT NULL,
    upload_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    hair_length_mm INTEGER,
    growth_rate_mm_per_day DECIMAL(4,2),
    style_preference TEXT,
    last_cut_date DATE,
    next_cut_recommendation DATE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create user_preferences table for style settings
CREATE TABLE user_preferences (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    preferred_hair_length_mm INTEGER DEFAULT 25,
    cut_frequency_weeks INTEGER DEFAULT 4,
    style_type TEXT DEFAULT 'short',
    reminder_enabled BOOLEAN DEFAULT true,
    reminder_days_before INTEGER DEFAULT 3,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(user_id)
);

-- Enable Row Level Security
ALTER TABLE hair_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_preferences ENABLE ROW LEVEL SECURITY;

-- Create policies for hair_photos
CREATE POLICY "Users can view own hair photos" ON hair_photos
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own hair photos" ON hair_photos
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own hair photos" ON hair_photos
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own hair photos" ON hair_photos
    FOR DELETE USING (auth.uid() = user_id);

-- Create policies for user_preferences
CREATE POLICY "Users can view own preferences" ON user_preferences
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own preferences" ON user_preferences
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own preferences" ON user_preferences
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own preferences" ON user_preferences
    FOR DELETE USING (auth.uid() = user_id);

-- Create indexes for better performance
CREATE INDEX idx_hair_photos_user_id ON hair_photos(user_id);
CREATE INDEX idx_hair_photos_upload_date ON hair_photos(upload_date DESC);
CREATE INDEX idx_user_preferences_user_id ON user_preferences(user_id);