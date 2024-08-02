import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Suspense } from "react";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Youth Soccer Club",
  description: "A simple app to view the database of a youth soccer club.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <meta name="darkreader-lock"></meta>
      </head>
      <body className={inter.className}>
        <div
          className={`flex min-h-screen flex-col items-center justify-between p-24`}
        >
          <Suspense fallback={null}>{children}</Suspense>
        </div>
      </body>
    </html>
  );
}
