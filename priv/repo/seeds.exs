# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GraphqlSydney.Repo.insert!(%GraphqlSydney.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GraphqlSydney.Repo
alias GraphqlSydney.Events.{Meetup, Talk, Person, Location}

Repo.delete_all(Talk)
Repo.delete_all(Person)
Repo.delete_all(Meetup)
Repo.delete_all(Location)

domain = Repo.insert!(
  %Location{
    name: "Domain",
    street_address: "55 Pyrmont St",
    suburb: "Pyrmont",
    state: "NSW",
    country: "Australia",
    postcode: "2009",
    map_url: "https://www.google.com/maps/place/55+Pyrmont+St,+Pyrmont+NSW+2009/@-33.86814,151.1940918,17z/data=!3m1!4b1!4m5!3m4!1s0x6b12ae36929b8279:0x5f882e03d383cc12!8m2!3d-33.86814!4d151.1940918"
  }, on_conflict: :replace_all, conflict_target: :name
)

we_work = Repo.insert!(
  %Location{
    name: "WeWork",
    street_address: "100 Harris St",
    suburb: "Pyrmont",
    state: "NSW",
    country: "Australia",
    postcode: "2009",
    map_url: "https://www.google.com.au/maps/place/WeWork+Pyrmont/@-33.8684613,151.1937766,15z/data=!4m5!3m4!1s0x0:0x284bed171a7c5347!8m2!3d-33.8684613!4d151.1937766"
  }, on_conflict: :replace_all, conflict_target: :name
)

josh_price = Repo.insert!(
  %Person{
    name: "Josh Price",
    avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/4/5/c/e/member_12197870.jpeg",
    meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/8425371/",
    website_url: "https://alembic.com.au",
    twitter: "@joshprice"
  }, on_conflict: :replace_all, conflict_target: :name
)

keith_pitt  = Repo.insert!(
  %Person{
    name: "Keith Pitt",
    avatar_url: "https://secure.meetupstatic.com/photos/member/e/9/d/b/highres_261659867.jpeg",
    meetup_url: "https://www.meetup.com/GraphQL-Melbourne/members/13725297/",
    website_url: "https://buildkite.com",
    twitter: "@keithpitt"
  }, on_conflict: :replace_all, conflict_target: :name
)

joseph_glanville = Repo.insert!(
  %Person{
    name: "Joseph Glanville",
    avatar_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAuOAAAAJGZhNTY5NTA4LWNhZDQtNDliMy04OGIzLWM3ODllMDlmZDY2Mw.jpg",
    meetup_url: "https://www.meetup.com/GraphQL-Sydney/members/12691284/",
    website_url: "http://www.apollodata.com/",
    twitter: "@jpgvm"
  }, on_conflict: :replace_all, conflict_target: :name
)

chris_giffard = Repo.insert!(
  %Person{
    name: "Chris Giffard",
    avatar_url: "https://d8142femxnlg1.cloudfront.net/cropped-profile-photos/8ffb1f2c99fb6c0c9bf9a2c5ff9415978d128242-s300.jpg",
    meetup_url: "https://www.meetup.com/GraphQL-Sydney/members/66982312/",
    website_url: "https://autopilothq.com/",
    twitter: "@cgiffard"
  }, on_conflict: :replace_all, conflict_target: :name
)

james_sadler = Repo.insert!(
  %Person{
    name: "James Sadler",
    avatar_url: "https://a248.e.akamai.net/secure.meetupstatic.com/photos/member/2/8/f/b/member_258850491.jpeg",
    meetup_url: "https://www.meetup.com/en-AU/sydney-ex/members/202221787/",
    website_url: "https://alembic.com.au",
    twitter: "@freshtonic"
  }, on_conflict: :replace_all, conflict_target: :name
)

dave_parry = Repo.insert!(
  %Person{
    name: "Dave Parry",
    avatar_url: "https://secure.meetupstatic.com/photos/member/d/3/4/c/member_81234092.jpeg",
    meetup_url: "https://www.meetup.com/sydney-ex/members/12433325/",
    website_url: "http://suranyami.com/",
    twitter: "@suranyami"
  }, on_conflict: :replace_all, conflict_target: :name
)

sputnik_antolovich = Repo.insert!(
  %Person{
    name: "Sputnik Antolovich",
    avatar_url: "https://secure.meetupstatic.com/photos/member/3/4/6/2/highres_269533410.jpeg",
    meetup_url: "https://www.meetup.com/GraphQL-Sydney/members/200796744/",
    website_url: "https://trioxis.com/",
    twitter: "https://www.facebook.com/sputnik.antolovich"
  }, on_conflict: :replace_all, conflict_target: :name
)


raw_meetups = [
  %Meetup{
    title: "Realtime and Serverless APIs",
    subtitle: "Looking into the Future of GraphQL",
    slug: "realtime-and-serverless-apis-with-graphql",
    date: ~D[2017-12-14],
    location: domain,
    description: """
    We're bringing together everyone who is as excited about the potential of GraphQL as we are.

    We've got an inspiring lineup of speakers to help introduce you to GraphQL and show you how it can help you build better APIs faster than ever.

    We'll be trialling an incredible new venue too, thanks to [Domain](https://www.domain.com.au).

    Some light food and drinks will be available thanks to [Alembic](https://alembic.com.au).

    [Follow us on Twitter](https://twitter.com/graphqlsydney) for updates.

    Can't wait to see you there!

    _Josh, James and Suzie_
    """,
    url: "https://www.meetup.com/GraphQL-Sydney/events/245093762/",
    talks: [
      %Talk{
        title: "GraphQL 101",
        slug: "graphql-101",
        description: """
        A short intro to practical GraphQL basics to get you up to speed quickly.
        """,
        presenter: dave_parry
      },
      %Talk{
        title: "Serverless GraphQL APIs",
        slug: "serverless-graphql-apis",
        description: """
        An exploration of how Serverless (or Functions as a Service) are being used to back GraphQL APIs.
        """,
        presenter: sputnik_antolovich
      },
      %Talk{
        title: "Real-time APIs with GraphQL Subscriptions",
        slug: "real-time-apis-with-graphql-subscriptions",
        description: """
        One of the features that gives GraphQL a major advantage over REST is it's ability to take
        advantage of persistent connections and provide real-time updates to connected clients.

        Now that subscriptions has finally been merged back into the GraphQL spec, incorporated
        into the major server implementations and HTTP/2 usage in on the rise, it's time
        to take full advantage of this feature.

        James will demonstrate how you can use this in your own applications. He'll present
        a demonstration of [Apollo Client 2.0](https://dev-blog.apollodata.com/apollo-client-2-0-5c8d0affcec7)
        connecting to an [Absinthe](http://absinthe-graphql.org/) backend using the
        power of [Phoenix](http://phoenixframework.org/) [Channels](https://hexdocs.pm/phoenix/channels.html).
        """,
        presenter: james_sadler
      }
    ]
  },
  %Meetup{
    title: "Get Ready For The Realtime Web",
    subtitle: "First GraphQL Sydney Meetup",
    slug: "get-ready-for-the-realtime-web-with-graphql",
    date: ~D[2017-06-08],
    location: we_work,
    description: """
    We're bringing together everyone who is as excited about the potential of GraphQL as we are.

    A variety of short talks from passionate GraphQL practitioners will cover all aspects of GraphQL from frontend to backend.

    Some light food as well as craft beer and cider on tap will be available.
    """,
    url: "https://www.meetup.com/GraphQL-Sydney/events/237438330/",
    talks: [
      %Talk{
        title: "The GraphQL Landscape",
        slug: "the-graphql-landscape",
        description: """
        For such a relatively young API technology, GraphQL has won hearts and minds.
        The Community has grown rapidly and created a rich ecosystem of useful tooling.

        Josh will present a high level overview of the GraphQL ecosystem, the tech,
        as well as the companies who are building GraphQL APIs.
        """,
        presenter: josh_price
      },
      %Talk{
        title: "Building User Interfaces with Relay and GraphQL",
        slug: "building-user-interfaces-with-relay-and-graphql",
        description: """
        Keith is one of the earliest and most passionate GraphQL exponents in Australia.
        Buildkite has boasted an easy to use GraphQL API written in Ruby for a long time now.

        Keith will show you how Relay makes building data layers for client web apps very straightforward
        and might even surprise you with some live coding.
        """,
        presenter: keith_pitt
      },
      %Talk{
        title: "Introduction to Apollo Client",
        slug: "introduction-to-apollo-client",
        description: """
        Apollo Client is a flexible, community-focused GraphQL client for JavaScript.

        Joseph will cover why you may want a GraphQL client, the types of GraphQL clients available,
        how they work and why Apollo Client is a great choice for most applications.
        """,
        presenter: joseph_glanville
      },
      %Talk{
        title: "How GraphQL Led Us To Strongly Type Our Whole Stack",
        slug: "how-graphql-led-us-to-strongly-type-our-whole-stack",
        description: """
        When Autopilot first decided on GraphQL to form the basis of their new API —
        they, like most people — were primarily interested in the client-facing features.

        Ultimately though, GraphQL's strongly typed interface caused us them rethink every layer behind the facade.
        Chris will take you on their journey to stronger typing and the benefits.
        """,
        presenter: chris_giffard
      }
    ]
  }
]

for raw_meetup <- raw_meetups do
  GraphqlSydney.Repo.insert!(raw_meetup, on_conflict: :replace_all, conflict_target: :slug)
end
