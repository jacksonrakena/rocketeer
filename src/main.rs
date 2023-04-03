use std::collections::HashMap;
use std::io::ErrorKind::NotFound;
use std::net::SocketAddr;
use axum::http::StatusCode;
use axum::{Json, Router, ServiceExt};
use axum::extract::Path;
use axum::routing::{get,post};
use axum::response::{IntoResponse, Redirect};
use serde::{Deserialize, Serialize};

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt::init();
    let app = Router::new()
        .route("/", get(root))
        .route("/s/:link_id", get(unshorten_link));

    let addr = SocketAddr::from(([127,0,0,1], 3000));
    tracing::info!("listening on {}", addr);
    axum::Server::bind(&addr).serve(app.into_make_service()).await.unwrap();
}

#[derive(Serialize)]
struct RootServiceResponse {
    available: Vec<ServiceInformation>
}

#[derive(Serialize)]
struct ServiceInformation {
    name: String,
    path: String
}

async fn root() -> (StatusCode, Json<RootServiceResponse>) {
    (StatusCode::OK, Json(RootServiceResponse {
        available: vec![
            ServiceInformation {
                name: "link_shortener".to_string(),
                path: "/s".to_string()
            }
        ]
    }))
}

async fn unshorten_link(Path(link_id): Path<String>) -> Result<Redirect, StatusCode> {
    let map = HashMap::from([
        ("jackson", "https://jacksonrakena.com")
    ]);

    return map
        .get(link_id.as_str())
        .map_or(Err(StatusCode::NOT_FOUND), |out|{ Ok(Redirect::temporary(out)) });
}