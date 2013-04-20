name := "PhotaCon"

version := "0.0.1"

organization := "net.liftweb"

scalaVersion := "2.9.1"

retrieveManaged := true

EclipseKeys.createSrc := EclipseCreateSrc.Default + EclipseCreateSrc.Resource

EclipseKeys.withSource := true

resolvers ++= Seq("snapshots"     at "http://oss.sonatype.org/content/repositories/snapshots",
                "releases"        at "http://oss.sonatype.org/content/repositories/releases"
                )

seq(com.github.siasia.WebPlugin.webSettings :_*)

unmanagedResourceDirectories in Test <+= (baseDirectory) { _ / "src/main/webapp" }

scalacOptions ++= Seq("-deprecation", "-unchecked")

libraryDependencies ++= {
	val liftVersion = "2.5-M3" // Put the current/latest lift version here
	Seq(
		"net.liftweb" %% "lift-webkit" % liftVersion % "compile->default",
		"net.liftweb" %% "lift-mapper" % liftVersion % "compile->default",
		"net.liftweb" %% "lift-wizard" % liftVersion % "compile->default"
	)
}

libraryDependencies ++= {
  val liftVersion = "2.5-M3"
  Seq(
  	"mysql" 			% "mysql-connector-java" % "5.1.21",
    "org.scribe"		%"scribe"				% "1.3.2",
    "net.liftmodules"   %% "lift-jquery-module" % (liftVersion + "-2.0"),
    "org.eclipse.jetty" % "jetty-webapp"        % "8.1.7.v20120910"  % "container,test",
    "org.eclipse.jetty.orbit" % "javax.servlet" % "3.0.0.v201112011016" % "container,test" artifacts Artifact("javax.servlet", "jar", "jar"),
    "ch.qos.logback"    % "logback-classic"     % "1.0.6",
    "org.specs2"        %% "specs2"             % "1.12.1"           % "test",
    "com.h2database"    % "h2"                  % "1.3.167"
  )
}
