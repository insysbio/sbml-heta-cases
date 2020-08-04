#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    kf = 0.9
    C = 1.0
    S1 = 1.0 / C
    kr = 0.075
    S2 = 2.0 / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    k1 = 0.75
    S3 = 1.0 / C
    k2 = 0.15
    S4 = 1.5 / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
            S4 * C,
        ],
        
        [
            C,
            k1,
            k2,
            kf,
            kr,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,kf,kr,) = p.static
    (S1_,S2_,S3_,S4_,) = u 

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    
    #p.static .= [C,k1,k2,kf,kr,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
      -reaction2,  # dS3_/dt
      reaction2,  # dS4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,kf,kr,) = integrator.p.static
        (S1_,S2_,S3_,S4_,) = u

        # Heta rules
        S1 = S1_ / C
        S2 = S2_ / C
        reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
        S3 = S3_ / C
        S4 = S4_ / C
        reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k1_ = k1
        k2_ = k2
        kf_ = kf
        kr_ = kr

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events
function event1_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (C,k1,k2,kf,kr,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    

    return S1 < 0.5 ? 1 : -1
end
function event2_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (C,k1,k2,kf,kr,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    

    return S3 < 0.75 ? 1 : -1
end

### continous events

### event assignments
function event1_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (C,k1,k2,kf,kr,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = integrator.u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    
    # recalculated values
    (S2,) = (1.5,)
    
    # save results

    integrator.u .= [
        S1 * C,
        S2 * C,
        S3 * C,
        S4 * C,
    ]
    
    integrator.p.static .= [C,k1,k2,kf,kr,]
end
function event2_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (C,k1,k2,kf,kr,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = integrator.u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2)
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * (k1 * S3 + (-1.0) * k2 * S4)
    
    # recalculated values
    (S4,) = (0.5,)
    
    # save results

    integrator.u .= [
        S1 * C,
        S2 * C,
        S3 * C,
        S4 * C,
    ]
    
    integrator.p.static .= [C,k1,k2,kf,kr,]
end


### OUTPUT ###

x00847 = Model(
  start_,
  ode_,
  [
      DEvent(event1_trigger_, event1_assignment_),
      DEvent(event2_trigger_, event2_assignment_),
  ],
  make_saving_,
  constants_
)

models = (
    x00847 = x00847
)
tasks = ()

export models, tasks

end
