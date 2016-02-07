# Hooker

Hooker is a POC Ruby on Rails application that demonstrates how to structure the configuration for a webhook dispatch system.

The basic concept is that a user can configure a Hook, which then has Calls, which then have attempts.

## Structure

**Hooks** - define a url which says where to deliver a payload. 
**Call** is a single instance of a Hook being required to be actioned. This is most typically based on event in your system ([EventBus](https://github.com/kevinrutherford/event_bus) is perfect for this).
**Attempt** is then a single attempt at performing the call. Attempts don’t always succeed first go and may need to be re-tried.

## Why Hooker?
Every time I’ve needed to fire off webhooks to clients, I’ve either inherited or been limited in what I’ve ben able to use. So I wanted to sit down and find a simple, suitable model that would handle the different requirements I’ve had in the past.

The next step is to turn this into a nice simple standalone sinatra API that can be re-used anytime an application requires webhook dispatch capability.