import { createClient } from "@supabase/supabase-js";
const supabaseUrl = "https://finrhpblooahrxtsrwsi.supabase.co";
const supabaseKey =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpbnJocGJsb29haHJ4dHNyd3NpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA4NTEyNTEsImV4cCI6MjA1NjQyNzI1MX0.MHjORsrE1dstUYk7-UjMvIMRBJRfEThi9TO7Yaxc9CU";
const supabase = createClient(supabaseUrl, supabaseKey);
export default supabase;
