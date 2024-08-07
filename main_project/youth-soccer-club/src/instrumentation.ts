import { seed } from "@/app/_util/seed";
import { sendEmailPeriodic } from "@/app/_util/sendEmail";
import cron from "node-cron";

export async function register() {
  console.log("Instrumentation registered", process.env.SEED);

  if (process.env.SEED === "true") {
    await seed();
  }

  cron.schedule("0 12 * * 0", sendEmailPeriodic);
}
