CREATE TABLE "project_settings" (
	"project_id" uuid NOT NULL,
	"run_command" text DEFAULT '' NOT NULL,
	"build_command" text DEFAULT '' NOT NULL,
	"install_command" text DEFAULT '' NOT NULL,
	CONSTRAINT "project_settings_project_id_unique" UNIQUE("project_id")
);
--> statement-breakpoint
ALTER TABLE "project_settings" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
ALTER TABLE "custom_domain_verification" ALTER COLUMN "status" SET DATA TYPE "undefined"."verification_request_status";--> statement-breakpoint
ALTER TABLE "custom_domain_verification" ALTER COLUMN "status" SET DEFAULT 'active';--> statement-breakpoint
ALTER TABLE "user_settings" ADD COLUMN "should_warn_delete" boolean DEFAULT true NOT NULL;--> statement-breakpoint
ALTER TABLE "project_settings" ADD CONSTRAINT "project_settings_project_id_projects_id_fk" FOREIGN KEY ("project_id") REFERENCES "public"."projects"("id") ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
DROP TYPE "public"."status";