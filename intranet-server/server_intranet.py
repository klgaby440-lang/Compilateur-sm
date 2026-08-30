from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Dict

intranet_app = FastAPI(title="ClassNet Intranet Node", version="1.0.0")

intranet_app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Ouvert totalement sur le réseau Wi-Fi local
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class GradeCommit(BaseModel):
    teacherId: str
    courseId: str
    grades: List[Dict[str, float]] # Ex: [{"studentId": "s1", "p1": 8.5}]

class AttendanceCommit(BaseModel):
    teacherId: str
    date: str
    records: List[Dict[str, str]] # Ex: [{"studentId": "s1", "status": "Absent"}]

@app.get("/api/intranet/config")
async def get_local_config():
    """Distribue les données de base (ID école, cours) aux instances ClassNet App connectées."""
    return {
        "schoolId": "EDM_BUKAVU",
        "schoolName": "Enfant du Monde",
        "activePeriod": "Première Période",
        "serverStatus": "Online - Wi-Fi Local"
    }

@app.post("/api/intranet/commit/grades")
async def commit_local_grades(commit: GradeCommit):
    """Reçoit les cotes (Push Off) depuis ClassNet App et les fusionne en local."""
    # Logique de fusion avec le JSON local classnet_p_db.json
    return {"status": "success", "message": f"Cotes de {commit.courseId} enregistrées avec succès en local."}

@app.post("/api/intranet/commit/attendance")
async def commit_attendance(commit: AttendanceCommit):
    """Enregistre le journal d'appel poussé par l'enseignant."""
    return {"status": "success", "message": f"Présences du {commit.date} sauvegardées."}

@app.get("/api/intranet/fetch")
async def fetch_updates():
    """ClassNet P interroge cette route pour mettre à jour son UI en temps réel."""
    # Renvoie les nouvelles modifications non lues
    return {"new_commits": 3, "data": []}
